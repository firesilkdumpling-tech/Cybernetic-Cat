var _mid = lane_x[1];
draw_set_halign(fa_center);

// judgement pop-up above the middle lane
if (judge_age < 0.6) {
    draw_set_alpha(1 - judge_age / 0.6);
    draw_set_color(judge_cols[last_judge]);
    draw_text_transformed(_mid, 330, judge_names[last_judge], 3, 3, 0);
    if (last_judge != JUDGE.MISS) {
        draw_text_transformed(_mid, 390, (last_error < 0 ? "EARLY " : "LATE ") + string(round(abs(last_error) * 1000)) + " ms", 1.5, 1.5, 0);
    }
    draw_set_alpha(1);
}

// HUD on the left of the playfield
draw_set_halign(fa_right);
draw_set_color(c_white);
var _hx = lane_x[0] - 120;
draw_text_transformed(_hx, 40,  "SCORE " + string(run_score), 2, 2, 0);
draw_text_transformed(_hx, 80,  "COMBO " + string(combo), 2, 2, 0);
draw_text_transformed(_hx, 140, "avg timing " + timing_ms_text(err_avg), 1.5, 1.5, 0);
draw_text_transformed(_hx, 170, "sync offset " + timing_ms_text(global.sync_offset) + "  (left / right)", 1.5, 1.5, 0);
if (RECORD_MODE) {
    draw_text_transformed(_hx, 220, "RECORDING: tap J K L, Enter saves.  taps: " + string(array_length(taps)), 1.5, 1.5, 0);
}

// results screen
if (finished && !RECORD_MODE) {
    draw_set_halign(fa_center);
    draw_text_transformed(_mid, 250, "SONG COMPLETE", 3, 3, 0);
    draw_text_transformed(_mid, 310, "SCORE " + string(run_score) + "   MAX COMBO " + string(max_combo), 2, 2, 0);
    draw_text_transformed(_mid, 360, "PERFECT " + string(counts[0]) + "  GREAT " + string(counts[1]) + "  GOOD " + string(counts[2]) + "  MISS " + string(counts[3]), 1.5, 1.5, 0);
    draw_text_transformed(_mid, 410, "press R to play again", 1.5, 1.5, 0);
}

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);
