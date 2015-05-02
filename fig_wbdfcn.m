
    function [] = fig_wbdfcn(varargin)
    global S;
    % The WindowButtonDownFcn for the figure.
        if any(gco==[S.rct(1);S.CURPRV(:)]) % Clicked in preview window.
            S.MAKPRV = ~S.MAKPRV;  % Change from current state.
            
            if S.MAKPRV
                set(S.CURPRV,'cdata',S.PCHCLR{S.PRVNUM},'facecolor','flat')
            else
                set(S.CURPRV,'facecolor',r_col)
            end
        elseif any(gco==[S.DSPDIG(3).ax [S.DSPDIG(3).P{:}]])
            % In here user wants to select a starting level.
            if strcmp(get(S.pbt,'string'),'Start')
                tmp = inputdlg('Enter Starting Level',...
                               'Level',1,{sprintf('%i',S.PLRLVL)});
                                
                if ~isempty(tmp)  % User might have closed dialog.           
                    S.PLRLVL = min(round(max(str2double(tmp),1)),9);
                    digits(S.DSPDIG(3),sprintf('%i',S.PLRLVL))
                end
            end
        end
    end
