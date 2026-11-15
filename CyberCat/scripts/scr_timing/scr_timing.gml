
#macro SPAWN_Y  0
#macro HIT_Y    608
#macro KILL_Y   800

#macro APPROACH_TIME  1.5

// Pixels per second.
#macro SCROLL_SPEED   ((HIT_Y - SPAWN_Y) / APPROACH_TIME)

// Silence before the song starts, so the very first notes can fall in.
#macro COUNT_IN       (APPROACH_TIME + 0.5)

// ---- hit windows 
#macro WINDOW_PERFECT  0.050
#macro WINDOW_GREAT    0.100
#macro WINDOW_GOOD     0.150

// ---- sync 
// Seconds the sound you hear lags behind the audio clock (speakers,
// Bluetooth, mixer buffer...). Positive = notes arrive later.
// Tune it live with the left / right arrow keys, then paste the value
// you settle on here.
#macro DEFAULT_SYNC_OFFSET  0.000

enum JUDGE { PERFECT, GREAT, GOOD, MISS }
enum NOTE  { WAITING, HIT, MISSED }


/// @func timing_note_y(note_time, song_time)
/// @desc Where a note belongs on screen: SPAWN_Y exactly APPROACH_TIME
///       before its time, HIT_Y exactly on its time, KILL_Y shortly after.
function timing_note_y(_note_time, _song_time) {
    return HIT_Y - (_note_time - _song_time) * SCROLL_SPEED;
}


/// @func timing_judge(error)
/// @desc error = song_time - note_time at the moment of the key press
///       (negative = early, positive = late). Returns a JUDGE value.
function timing_judge(_error) {
    var _e = abs(_error);
    if (_e <= WINDOW_PERFECT) return JUDGE.PERFECT;
    if (_e <= WINDOW_GREAT)   return JUDGE.GREAT;
    if (_e <= WINDOW_GOOD)    return JUDGE.GOOD;
    return JUDGE.MISS;
}


/// @func timing_beat_to_sec(beat, bpm, first_beat)
/// @desc Beat number (0 = the first beat) -> seconds into the song.
function timing_beat_to_sec(_beat, _bpm, _first_beat) {
    return _first_beat + _beat * 60 / _bpm;
}


/// @func timing_ms_text(seconds)
/// @desc 0.0123 -> "+12 ms",  -0.03 -> "-30 ms"
function timing_ms_text(_s) {
    var _v = round(_s * 1000);
    return (_v > 0 ? "+" : "") + string(_v) + " ms";
}