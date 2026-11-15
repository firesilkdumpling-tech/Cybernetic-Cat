var _dt = delta_time / 1000000;              // microseconds -> seconds
judge_age += _dt;

// 1. THE CLOCK
// Counts up from -COUNT_IN, starts the song at 0, then follows the audio.
clock += _dt;
if (!started) {
    if (clock >= 0) {
        music   = audio_play_sound(song, 1, false);
        started = true;
        clock   = 0;
    }
}
else if (audio_is_playing(music)) {
    // The clock moves smoothly every frame; the audio position is the truth,
    // so ease the clock toward it (snap if the two ever drift far apart).
    var _drift = audio_sound_get_track_position(music) - clock;
    if (abs(_drift) > 0.1) clock += _drift;
    else                   clock += _drift * 0.05;
}
song_time = clock - global.sync_offset;      // everything below uses this

// 2. SPAWN 
// A note is created the moment it should be at SPAWN_Y (y = 0).
var _count = array_length(notes);
while (next_i < _count && notes[next_i].t - APPROACH_TIME <= song_time) {
    var _n = notes[next_i];
    _n.inst = instance_create_depth(lane_x[_n.lane], SPAWN_Y, 100, obj_note, { data: _n, conductor: id });
    next_i++;
}

// 3. KEY PRESSES
for (var _l = 0; _l < 3; _l++) {
    if (!keyboard_check_pressed(lane_key[_l])) continue;

    if (RECORD_MODE) {
        array_push(taps, { t: song_time, lane: _l });
        continue;
    }

    // Only the earliest waiting note in this lane can be hit.
    for (var _i = first_live; _i < next_i; _i++) {
        var _note = notes[_i];
        if (_note.lane != _l || _note.state != NOTE.WAITING) continue;

        var _err = song_time - _note.t;      // negative = early, positive = late
        if (abs(_err) <= WINDOW_GOOD) {
            _note.state = NOTE.HIT;
            instance_destroy(_note.inst);
            judge(timing_judge(_err), _err);
        }
        break;                               // too early for it yet: ignore the press
    }
}

// 4. MISSES
// A note that has slipped past the hit window can no longer be hit.
// It keeps falling (dimmed) until it leaves the screen at KILL_Y.
for (var _i = first_live; _i < next_i; _i++) {
    var _note = notes[_i];
    if (_note.state == NOTE.WAITING && song_time - _note.t > WINDOW_GOOD) {
        _note.state = NOTE.MISSED;
        judge(JUDGE.MISS, song_time - _note.t);
    }
}
while (first_live < next_i && notes[first_live].state != NOTE.WAITING) first_live++;

// 5. SYNC NUDGE
// Hit the beat you HEAR. If "avg timing" stays late (+), press right;
// if it stays early (-), press left.
if (keyboard_check_pressed(vk_left))  global.sync_offset -= 0.005;
if (keyboard_check_pressed(vk_right)) global.sync_offset += 0.005;

// 6. END OF SONG + SHORTCUTS
if (started && !finished && !audio_is_playing(music) && first_live >= _count) {
    finished = true;
    if (RECORD_MODE) chart_export(taps);
}
if (RECORD_MODE && keyboard_check_pressed(vk_enter)) chart_export(taps);
if (keyboard_check_pressed(ord("R"))) {
    audio_stop_all();
    room_restart();
}

