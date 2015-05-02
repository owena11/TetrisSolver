
    function [] = clean_tet()
    global S;
    global g1;
    % Cleans up the board and board matrix after Game Over.
        stop_tet;  % Stop the timer.

        for kk = 1:20
            set(S.pch(:,kk),'cdata',g1,'edgecol','none')
            drawnow % Gives the nice effect of grey climbing up.
        end

        set(S.pbt,'string','Start')
        S.BRDMAT(:) = false; % Reset the board matrix.
    end

