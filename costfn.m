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
        newState = oldState-10;
        if(any(newState <= 0))
            break
        end
        
        currentBoard(oldState) = 0;

        if any(currentBoard(newState))
            currentBoard(oldState) = 1;
            break
        end  
        
        currentBoard(newState) = 1;

        oldState = newState;
   
    end

    %%%% Compute cost function for resting place
    TF = all(currentBoard);
    
    state.BRDMAT = currentBoard;

    sm = 0;
    if any(TF)
        sm = sum(TF);
        B =  currentBoard;
        B(:,TF) = 0;
        B = circshift(B',-1)';
        state.BRDMAT = B;
      
        state.CURLNS = state.CURLNS + sm;
        state.CURSCR = state.CURSCR+state.PNTVCT(sm);
    end
    if sm > 0
        score = state.PNTVCT(sm); % Dummy agent: always prefer moving to the right
   % pause(0.4);
    else
        score = 0;
    end
       
end
