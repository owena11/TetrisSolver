function [best_pos best_rot best_score,best_keystrokes] = agent(state, pos, rot,keystrokes, depth)

if nargin < 4
    depth = 1;
end
POS_RANGE = 9;
ROT_RANGE = 4;
MAX_DEPTH = 3;

if depth > MAX_DEPTH
    best_pos = pos;
    best_rot = rot;
    best_score = costfn(state, pos, rot);
    best_keystrokes = keystrokes;
    return
end

MAX_ROT = [2, 4, 4, 4, 2, 2, 1] - 1;


best_pos = pos;
best_rot = rot;
best_score = -inf; % Higher score = better
for r = 0:MAX_ROT(state.PNM)
     for p = 1:10
        try_state = state; % Make copy of the state
        [try_state valid k] = move_piece(try_state, p, r);
        keystrokes = [keystrokes;k];
        %figure(1); imagesc(imresize(try_state.BRDMAT,[40 400])); drawnow
        if ~valid, continue; end
        [pp rr s kk] = agent(try_state, p, r,keystrokes, depth+1);
        if s > best_score
            best_score = s;
            best_pos = pp;
            best_rot = rr;
            best_keystrokes = kk;
        end
    end
end


