depth = -1000;                               // draw the HUD above everything

lane_x   = [864, 1056, 1248];                // J, K, L columns
lane_key = [ord("J"), ord("K"), ord("L")];

// kept across restarts so your calibration isn't lost
if (!variable_global_exists("sync_offset")) global.sync_offset = DEFAULT_SYNC_OFFSET;

chart      = chart_build();
notes      = chart.notes;                    // sorted by time
next_i     = 0;                              // next note waiting to spawn
first_live = 0;                              // oldest note not yet hit or missed

song       = snd_sharp_enough;               // the Sound asset you imported
music      = -1;                             // sound instance, once playing
started    = false;
finished   = false;
clock      = -COUNT_IN;                      // audio clock in seconds (negative = count-in)
song_time  = clock;                          // clock minus sync offset: drives everything

taps = [];                                   // record mode only

// scoring + feedback
judge_points = [300, 200, 100, 0];
judge_names  = ["PERFECT", "GREAT", "GOOD", "MISS"];
judge_cols   = [c_aqua, c_lime, c_yellow, c_red];
counts       = [0, 0, 0, 0];
run_score    = 0;
combo        = 0;
max_combo    = 0;
last_judge   = JUDGE.MISS;
last_error   = 0;
judge_age    = 999;                          // seconds since the last judgement
err_avg      = 0;                            // running average timing error (+ = late)

judge = function(_j, _err) {
    counts[_j]++;
    run_score += judge_points[_j];
    if (_j == JUDGE.MISS) {
        combo = 0;
    } else {
        combo++;
        max_combo = max(max_combo, combo);
        err_avg = lerp(err_avg, _err, 0.2);
    }
    last_judge = _j;
    last_error = _err;
    judge_age  = 0;
};
