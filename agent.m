function [best_pos best_rot best_score,best_keystrokes] = agent(state, pos, rot,keystrokes, depth)

best_score = state.CURSCR; % Higher score = better

POS_RANGE = 9;
ROT_RANGE = 4;
MAX_DEPTH = 1;

if depth > MAX_DEPTH
    best_pos = pos;
    best_rot = rot;
   % best_score = costfn(state, pos, rot);
    best_keystrokes = keystrokes;
    return
end
best_keystrokes = [];
if isequal(depth,2) 
    state = add_piece(state, state.PRVNUM);
    
elseif depth > 2
    state = add_piece(state,randi(7,1,1));
end

MAX_ROT = [2, 4, 4, 4, 2, 2, 1] - 1;


best_pos = pos;
best_rot = rot;
for r = 0:MAX_ROT(state.PNM)
     for p = 1:10
        try_state = state; % Make copy of the state
        [try_state valid k] = move_piece(try_state, p, r);

        %figure(1); imagesc(imresize(try_state.BRDMAT,[40 400])); drawnow

        if ~valid, continue; end
        [~, new_state] = costfn(try_state, pos, rot);

        %%% Add shape to cstfn state 
        figure(1); sc(new_state.BRDMAT); drawnow
        pause(0.000000001)
        [pp, rr, s, kk] = agent(new_state, p, r,k, depth+1 );
                
        if best_score <= s
            best_score = s;
            best_pos = pp;
            best_rot = rr;
            best_keystrokes = kk;
        end
 

    end
end


