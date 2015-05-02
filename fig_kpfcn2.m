

    function [] = fig_kpfcn2(varargin)
    global S;
    % Callback handles the case when 's' or 'p' is pressed if 
    % the game is paused or at game start.
        tmp = strcmp(get(S.pbt,'string'),{'Start','Continue'});
        
        if tmp(1)
            if strcmp(varargin{2}.Key,'s')
                pbt_call;  % User wants to start a game.
            end
        else 
            if tmp(2)
                if any(strcmp(varargin{2}.Key,...
                       {'1','2','3','4','5','6','7'}))
                    make_preview(str2double(varargin{2}.Key));
                    return
                end
            end
            
            if strcmp(varargin{2}.Key,'p')
                pbt_call;  % User wants to pause/unpause.
            end

            if strcmp(varargin{2}.Key,'n')
                quit_check;  % Perhaps user wants to quit.
            end
        end
    end

