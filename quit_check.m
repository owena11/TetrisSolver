
    function [] = quit_check()
    global S;
    % Creates a dialog box to check if the user wants to quit.
        QG = questdlg('Are you sure you want to start over?',...
                      'End current game?', ...
                      'Yes', 'No', 'Yes');
        if strcmp(QG,'Yes')
            clean_tet;
            % The call to UICONTROL is necessary if a line has
            % just been scored and the user hits n to start a new
            % game but not otherwise ... mysterious...
            uicontrol(S.pbt)
            pbt_call;
        end
    end