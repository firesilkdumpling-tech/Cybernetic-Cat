#macro SONG_BPM         100
#macro SONG_FIRST_BEAT  0.000


#macro RECORD_MODE  false

#macro RECORD_SNAP  4

function chart_sec(_c, _sec, _lane) {
    array_push(_c.notes, { t: _sec, lane: _lane, state: NOTE.WAITING, inst: noone });
}


function chart_beat(_c, _beat, _lane) {
    chart_sec(_c, timing_beat_to_sec(_beat, _c.bpm, _c.first_beat), _lane);
}

function chart_build() {
    var _c = { bpm: SONG_BPM, first_beat: SONG_FIRST_BEAT, notes: [] };

    if (!RECORD_MODE) {
        // Auto-generated from SHARP_ENOUGH.wav: 100 BPM, beat 0 at 0.000 s.
        // Lane = pitch of the hit (low J, mid K, high L). Beats are quarter notes; .5 = 8th, .25/.75 = 16th.
        // Paste hand-recorded lines from chart_recorded.txt below this line if you want to add to it.

        chart_beat(_c, 1.5, 1);
        chart_beat(_c, 3, 0);
        chart_beat(_c, 4, 1);
        chart_beat(_c, 5, 0);
        chart_beat(_c, 5.5, 1);
        chart_beat(_c, 7, 0);
        chart_beat(_c, 8, 1);
        chart_beat(_c, 9.5, 1);
        chart_beat(_c, 11, 0);
        chart_beat(_c, 14.5, 1);
        chart_beat(_c, 16, 0);
        chart_beat(_c, 17.5, 0);
        chart_beat(_c, 23, 1);
        chart_beat(_c, 24, 2);
        chart_beat(_c, 25.5, 0);
        chart_beat(_c, 26.5, 1);
        chart_beat(_c, 28, 0);
        chart_beat(_c, 29.5, 0);
        chart_beat(_c, 30, 1);
        chart_beat(_c, 32, 0);
        chart_beat(_c, 33.5, 1);
        chart_beat(_c, 37.5, 1);
        chart_beat(_c, 38, 0);
        chart_beat(_c, 39, 1);
        chart_beat(_c, 39.5, 2);
        chart_beat(_c, 40, 1);
        chart_beat(_c, 40.5, 2);
        chart_beat(_c, 41, 2);
        chart_beat(_c, 41.5, 1);
        chart_beat(_c, 43, 2);
        chart_beat(_c, 43.5, 1);
        chart_beat(_c, 44, 1);
        chart_beat(_c, 44.5, 2);
        chart_beat(_c, 45, 2);
        chart_beat(_c, 45.5, 1);
        chart_beat(_c, 46.5, 1);
        chart_beat(_c, 47, 2);
        chart_beat(_c, 47.5, 1);
        chart_beat(_c, 48, 1);
        chart_beat(_c, 49, 2);
        chart_beat(_c, 49.5, 1);
        chart_beat(_c, 51, 2);
        chart_beat(_c, 51.5, 1);
        chart_beat(_c, 52, 1);
        chart_beat(_c, 52.5, 2);
        chart_beat(_c, 53, 2);
        chart_beat(_c, 53.5, 1);
        chart_beat(_c, 54.5, 0);
        chart_beat(_c, 55, 2);
        chart_beat(_c, 55.5, 2);
        chart_beat(_c, 56, 1);
        chart_beat(_c, 57, 2);
        chart_beat(_c, 57.5, 1);
        chart_beat(_c, 58.5, 2);
        chart_beat(_c, 59, 2);
        chart_beat(_c, 59.75, 0);
        chart_beat(_c, 61, 2);
        chart_beat(_c, 61.5, 1);
        chart_beat(_c, 62, 1);
        chart_beat(_c, 62.5, 0);
        chart_beat(_c, 63, 2);
        chart_beat(_c, 63.5, 1);
        chart_beat(_c, 64, 0);
        chart_beat(_c, 65, 2);
        chart_beat(_c, 65.5, 0);
        chart_beat(_c, 67, 2);
        chart_beat(_c, 67.5, 1);
        chart_beat(_c, 68, 0);
        chart_beat(_c, 68.75, 0);
        chart_beat(_c, 69.5, 1);
        chart_beat(_c, 70, 2);
        chart_beat(_c, 70.5, 0);
        chart_beat(_c, 71, 2);
        chart_beat(_c, 71.5, 1);
        chart_beat(_c, 72, 0);
        chart_beat(_c, 73, 2);
        chart_beat(_c, 73.5, 1);
        chart_beat(_c, 75, 2);
        chart_beat(_c, 75.5, 1);
        chart_beat(_c, 76, 0);
        chart_beat(_c, 76.5, 2);
        chart_beat(_c, 77, 2);
        chart_beat(_c, 77.5, 1);
        chart_beat(_c, 78, 2);
        chart_beat(_c, 78.5, 0);
        chart_beat(_c, 79, 2);
        chart_beat(_c, 79.5, 1);
        chart_beat(_c, 80, 0);
        chart_beat(_c, 81, 2);
        chart_beat(_c, 81.5, 1);
        chart_beat(_c, 83, 2);
        chart_beat(_c, 83.5, 1);
        chart_beat(_c, 84, 0);
        chart_beat(_c, 84.5, 2);
        chart_beat(_c, 85, 2);
        chart_beat(_c, 85.5, 1);
        chart_beat(_c, 86, 2);
        chart_beat(_c, 86.5, 0);
        chart_beat(_c, 87, 2);
        chart_beat(_c, 87.5, 1);
        chart_beat(_c, 88, 1);
        chart_beat(_c, 89, 2);
        chart_beat(_c, 89.5, 0);
        chart_beat(_c, 91, 2);
        chart_beat(_c, 91.5, 1);
        chart_beat(_c, 92, 0);
        chart_beat(_c, 93, 2);
        chart_beat(_c, 93.5, 0);
        chart_beat(_c, 94, 1);
        chart_beat(_c, 94.5, 1);
        chart_beat(_c, 95, 2);
        chart_beat(_c, 95.5, 0);
        chart_beat(_c, 96, 0);
        chart_beat(_c, 100.5, 1);
        chart_beat(_c, 101.25, 0);
        chart_beat(_c, 102.5, 0);
        chart_beat(_c, 103.5, 1);
        chart_beat(_c, 104, 0);
        chart_beat(_c, 106, 0);
        chart_beat(_c, 108.5, 1);
        chart_beat(_c, 109.25, 0);
        chart_beat(_c, 110, 1);
        chart_beat(_c, 110.5, 0);
        chart_beat(_c, 111.5, 0);
        chart_beat(_c, 112, 1);
        chart_beat(_c, 113.5, 1);
        chart_beat(_c, 114, 0);
        chart_beat(_c, 115.5, 0);
        chart_beat(_c, 116, 1);
        chart_beat(_c, 116.5, 1);
        chart_beat(_c, 117.25, 2);
        chart_beat(_c, 119, 0);
        chart_beat(_c, 119.5, 0);
        chart_beat(_c, 120, 1);
        chart_beat(_c, 121.5, 0);
        chart_beat(_c, 122.5, 0);
        chart_beat(_c, 124, 1);
        chart_beat(_c, 126, 0);
        chart_beat(_c, 128, 0);
        chart_beat(_c, 132, 1);
        chart_beat(_c, 136, 0);
        chart_beat(_c, 136.5, 0);
        chart_beat(_c, 137.5, 1);
        chart_beat(_c, 140, 0);
        chart_beat(_c, 142, 0);
        chart_beat(_c, 144, 1);
        chart_beat(_c, 144.5, 2);
        chart_beat(_c, 145, 1);
        chart_beat(_c, 145.5, 2);
        chart_beat(_c, 146, 2);
        chart_beat(_c, 147, 1);
        chart_beat(_c, 147.5, 2);
        chart_beat(_c, 148, 0);
        chart_beat(_c, 148.5, 2);
        chart_beat(_c, 149, 2);
        chart_beat(_c, 149.5, 0);
        chart_beat(_c, 150, 2);
        chart_beat(_c, 151, 1);
        chart_beat(_c, 151.5, 2);
        chart_beat(_c, 152, 0);
        chart_beat(_c, 152.5, 2);
        chart_beat(_c, 153.5, 0);
        chart_beat(_c, 154, 2);
        chart_beat(_c, 154.5, 1);
        chart_beat(_c, 155.5, 2);
        chart_beat(_c, 156, 0);
        chart_beat(_c, 158, 0);
        chart_beat(_c, 160, 1);
        chart_beat(_c, 161, 0);
        chart_beat(_c, 161.5, 1);
        chart_beat(_c, 163, 1);
        chart_beat(_c, 164, 2);
        chart_beat(_c, 165, 0);
        chart_beat(_c, 165.5, 1);
        chart_beat(_c, 167, 0);
        chart_beat(_c, 168, 1);
        chart_beat(_c, 168.5, 2);
        chart_beat(_c, 169, 2);
        chart_beat(_c, 169.5, 0);
        chart_beat(_c, 170.5, 2);
        chart_beat(_c, 171, 2);
        chart_beat(_c, 171.75, 1);
        chart_beat(_c, 172.5, 2);
        chart_beat(_c, 173, 2);
        chart_beat(_c, 173.5, 1);
        chart_beat(_c, 174.5, 1);
        chart_beat(_c, 175, 2);
        chart_beat(_c, 175.5, 1);
        chart_beat(_c, 176, 1);
        chart_beat(_c, 177, 2);
        chart_beat(_c, 177.5, 1);
        chart_beat(_c, 179, 2);
        chart_beat(_c, 179.75, 1);
        chart_beat(_c, 181, 2);
        chart_beat(_c, 181.5, 1);
        chart_beat(_c, 182.5, 0);
        chart_beat(_c, 183, 2);
        chart_beat(_c, 183.5, 1);
        chart_beat(_c, 184, 1);
        chart_beat(_c, 185, 2);
        chart_beat(_c, 185.5, 0);
        chart_beat(_c, 186.5, 1);
        chart_beat(_c, 187, 2);
        chart_beat(_c, 187.5, 1);
        chart_beat(_c, 188, 1);
        chart_beat(_c, 189, 2);
        chart_beat(_c, 189.5, 1);
        chart_beat(_c, 190, 0);
        chart_beat(_c, 190.5, 1);
        chart_beat(_c, 191, 2);
        chart_beat(_c, 191.5, 0);
        chart_beat(_c, 192, 0);
        chart_beat(_c, 193, 2);
        chart_beat(_c, 193.5, 0);
        chart_beat(_c, 195, 2);
        chart_beat(_c, 195.5, 1);
        chart_beat(_c, 196, 0);
        chart_beat(_c, 196.75, 0);
        chart_beat(_c, 197.5, 1);
        chart_beat(_c, 198, 2);
        chart_beat(_c, 198.5, 0);
        chart_beat(_c, 199, 2);
        chart_beat(_c, 199.5, 1);
        chart_beat(_c, 200, 0);
        chart_beat(_c, 201, 2);
        chart_beat(_c, 201.5, 0);
        chart_beat(_c, 203, 2);
        chart_beat(_c, 203.5, 1);
        chart_beat(_c, 204, 0);
        chart_beat(_c, 204.5, 2);
        chart_beat(_c, 205, 2);
        chart_beat(_c, 205.5, 1);
        chart_beat(_c, 206, 2);
        chart_beat(_c, 206.5, 0);
        chart_beat(_c, 208, 1);
        chart_beat(_c, 209.5, 1);
        chart_beat(_c, 211, 2);
        chart_beat(_c, 211.5, 1);
        chart_beat(_c, 212, 0);
        chart_beat(_c, 212.5, 2);
        chart_beat(_c, 213, 2);
        chart_beat(_c, 213.5, 1);
        chart_beat(_c, 214, 2);
        chart_beat(_c, 214.5, 0);
        chart_beat(_c, 215, 2);
        chart_beat(_c, 215.5, 1);
        chart_beat(_c, 216, 1);
        chart_beat(_c, 216.5, 2);
        chart_beat(_c, 217, 2);
        chart_beat(_c, 217.5, 0);
        chart_beat(_c, 218.5, 2);
        chart_beat(_c, 219, 2);
        chart_beat(_c, 219.5, 1);
        chart_beat(_c, 220, 0);
        chart_beat(_c, 221, 2);
        chart_beat(_c, 221.5, 0);
        chart_beat(_c, 222, 1);
        chart_beat(_c, 222.5, 1);
        chart_beat(_c, 223, 2);
        chart_beat(_c, 223.5, 0);

    }

    array_sort(_c.notes, function(_a, _b) { return _a.t - _b.t; });
    return _c;
}

function chart_export(_taps) {
    var _n = array_length(_taps);
    if (_n == 0) return;

    var _out = "";
    for (var _i = 0; _i < _n; _i++) {
        var _t = _taps[_i].t;
        if (RECORD_SNAP > 0) {
            var _beat = (_t - SONG_FIRST_BEAT) * SONG_BPM / 60;
            _beat = round(_beat * RECORD_SNAP) / RECORD_SNAP;
            _t = timing_beat_to_sec(_beat, SONG_BPM, SONG_FIRST_BEAT);
        }
        _out += "chart_sec(_c, " + string_format(_t, 1, 3) + ", " + string(_taps[_i].lane) + ");\n";
    }

    clipboard_set_text(_out);
    var _f = file_text_open_write("chart_recorded.txt");
    file_text_write_string(_f, _out);
    file_text_close(_f);
    show_debug_message("Chart saved to " + game_save_id + "chart_recorded.txt (also copied to the clipboard)");
}
