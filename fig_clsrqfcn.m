
    function [] = fig_clsrqfcn(varargin)
    global S;
    % Clean-up if user closes figure while timer is running.
        try  % Try here so user can close after error in creation of GUI.
            warning('off','MATLAB:timer:deleterunning')
            delete(S.tmr)  % We always want the timer destroyed first.
            warning('on','MATLAB:timer:deleterunning')
            SCR = S.CURHSC;

            try
                save('TETRIS_HIGH_SCORE.mat','SCR')
            catch  %#ok
                disp('Unable to save high score. Check permissions.')
            end
        catch %#ok
        end
        
        delete(varargin{1})  % Now we can close it down.
    end
