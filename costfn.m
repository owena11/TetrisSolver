function [score , state] = costfn(state, pos, rot)
% Given current state and proposed [pos rot], evaluate
% the result of dropping the piece if it was first placed
% at [pos rot]. Higher = better.
    currentBoard= state.BRDMAT;

    oldState = state.CUR;
    boardCount = nnz(currentBoard);

    canMove = true;

    %%%% Move downwards untill there as a collision
    while(canMove)
        currentBoard(oldState) = 0;
        newState = oldState-10;
        currentBoard(newState(newState > 0)) = 1;

        if nnz(currentBoard) < boardCount
            currentBoard(oldState) = 1;
            currentBoard(newState(newState > 0)) = 0;
            break
        end
        pause(0.1)
        imshow(currentBoard)
        oldState = newState;
 
    end

    %%%% Compute cost function for resting place
    TF = all(currentBoard);

    if any(TF)
        sm = sum(TF);
        B = false(size(currentBoard));  % Temp store to switcheroo.
        B(:,1:20-sm) = currentBoard(:,~TF);
        state.BRDMAT = currentBoard;
        TF1 = find(TF); % We only need to drop those rows above.
        L = length(TF1);
        TF = TF1-(0:L-1);
        state.CURLNS = state.CURLNS + L;
        state.CURSCR = state.CURSCR+state.PNTVCT(L)*state.CURLVL;
    end

    score = 0; % Dummy agent: always prefer moving to the right

end
