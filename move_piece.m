function [state valid] = move_piece(state, pos, rot)

x1 = state.CUR(1);

[act_pos c1] = ind2sub( [10 20], x1 );

moves = pos - act_pos;
bak_state = state;
for i = 1:abs(pos - act_pos)
    if (moves < 0)
        [state valid] = trymove(state, -1);
    else
        [state valid] = trymove(state, 1);
    end
    if (~valid)
        state = bak_state;
        return
    end
end

MAX_ROT = [2, 4, 4, 4, 2, 2, 1] - 1;
for i = 1:min(rot, MAX_ROT(state.PNM))
    [state valid] = tryrotate(state);
    if (~valid)
        state = bak_state;
        return;
    end
end

valid = 1;
