function [state valid keystrokes] = move_piece(state, pos, rot)

keystrokes = [];
bak_state = state;

MAX_ROT = [2, 4, 4, 4, 2, 2, 1] - 1;
for i = 1:min(rot, MAX_ROT(state.PNM))
    [state valid] = tryrotate(state);
    % Add a rotation move
    if (~valid)
        state = bak_state;
        return;
    end
    
    keystrokes = [keystrokes;2];
end


x1 = state.CUR(1);
[act_pos c1] = ind2sub( [10 20], x1 );
moves = pos - act_pos;



for i = 1:abs(pos - act_pos)
    if (moves < 0)
        [state valid] = trymove(state, -1);
        % Add a negative move
    else
        [state valid] = trymove(state, 1);
        % Add a positive move
        
    end
    if (~valid)
        state = bak_state;
        return
    end
    keystrokes = [keystrokes;sign(moves)*1];
    
end

valid = 1;
