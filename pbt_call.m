

    function [] = pbt_call(varargin)
    global S;
    % Callback for the 'Start' ('Pause', 'Continue') button.
        switch get(S.pbt,'string')
            case 'Start'
                fcn_music_start();
                set(S.pch(:),'facecol','w','edgecol','w'); % Clear board.
                set(S.pbt,'string','Pause'); % Changle pushbutton label.
                digits(S.DSPDIG(3),sprintf('%i',S.PLRLVL)) % Show Level.
                ND = round(1000*S.LVLFAC^(S.PLRLVL-1))/1000;% Update Timer.
                set(S.tmr,'startdelay',ND,'period',ND);
                digits(S.DSPDIG(2),sprintf('%i',0)) % Score and Lines
                digits(S.DSPDIG(1),sprintf('%i',0))
                S.CURLNS = 0; % New Game -> start at zero.
                S.CURLVL = S.PLRLVL; % Set the level to players choice.
                S.CURSCR = 0; % New Game -> start at zero.
                play_tet; % Initiate Gameplay.
            case 'Pause'
                fcn_music_stop();
                stop_tet;  % Stop the timer, set the callbacks
                set([S.fig,S.pbt],'keypressfcn',@fig_kpfcn2)
                set(S.pbt,'string','Continue')
            case 'Continue'
                set(S.pbt,'string','Pause')
                start_tet;  % Restart the timer.
            otherwise
        end
    end
