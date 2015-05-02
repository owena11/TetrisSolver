function [score , S] = costfn(state, pos, rot)
% Given current state and proposed [pos rot], evaluate
% the result of dropping the piece if it was first placed
% at [pos rot]. Higher = better.
    currentBoard= state.BRDMAT(1:200);

    oldState = state.CUR;
    boardCount = nnz(currentBoard);

    canMove = ture;

    %%%% Move downwards untill there as a collision
    while(canMove)
        currerntBoard(oldState) = 1;
        newState = oldState-10;
        currentBoard(newState) = 1;

        if nnz(currentBoard) < boardCount
            canMove = false;
        else
            break;
        end
    end

    %%%% Compute cost function for resting place
    currentBoardMat = reshape(currentBoard, 10, 20);
    TF = all(currentBoardMat);

    if any(TF)
        sm = sum(TF);
        B = false(size(currentBoardMat));  % Temp store to switcheroo.
        B(:,1:20-sm) = currentBoardMat(:,~TF);
        S.BRDMAT = currentBoardMat;
        TF1 = find(TF); % We only need to drop those rows above.
        L = length(TF1);
        TF = TF1-(0:L-1);
        S.CURLNS = S.CURLNS + L;
        S.CURSCR = S.CURSCR+S.PNTVCT(L)*S.CURLVL;
    end

    score = ; % Dummy agent: always prefer moving to the right

end
