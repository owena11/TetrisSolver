function [best_pos best_rot best_score] = agent(state, pos, rot, depth)

if nargin < 2
    depth = 1;
end
POS_RANGE = 9;
ROT_RANGE = 4;
MAX_DEPTH = 3;

if depth > MAX_DEPTH
    best_pos = pos;
    best_rot = rot;
    best_score = costfn(state, pos, rot);
    return
end

best_pos = pos;
best_rot = rot;
best_score = -inf; % Higher score = better
for p = 1:POS_RANGE
    for r = 1:ROT_RANGE
        try_state = state; % Make copy of the state
        try_state = move_piece(try_state, p, r);
        [pp rr s] = agent(try_state, p, r, depth+1);
        if s > best_score
            best_score = s;
            best_pos = pp;
            best_rot = rr;
        end
    end
end


