
    function [] = fig_kpfcn(varargin)
    global S;
    % Figure (and pushbutton) keypressfcn
        S.STPTMR = 1;  % Stop timer interrupts.  See GAME_STEP

        if strcmp(varargin{2}.Key,'downarrow')
            game_step; % Just call another step.
            S.STPTMR = 0;  % Unblock the timer.
            return
        end

        col = ceil(S.CUR/10); % S.CUR defined in play_tet.
        row = rem(S.CUR-1,10) + 1;  % These index into board matrix.

        switch varargin{2}.Key
            case 'rightarrow'
                % Without this IF, the piece will wrap around!
                if max(row)<=9
                    uc = unique(col);  % Check if object to the right.

                    for kk = 1:length(uc)
                        if (S.BRDMAT(max(row(col==uc(kk)))+1,uc(kk)))
                            S.STPTMR = 0;
                            return
                        end
                    end

                    mover(1)   % O.k. to move.
                end
            case 'leftarrow'
                if min(row)>=2
                    uc = unique(col);  % Check if object to the left

                    for kk = 1:length(uc)
                        if (S.BRDMAT(min(row(col==uc(kk)))-1,uc(kk)))
                            S.STPTMR = 0;
                            return
                        end
                    end

                    mover(-1)  % O.k. to move.
                end
            case 'uparrow'
                if strcmp(varargin{2}.Modifier,'shift')
                    arg = 1;  % User wants counter-clockwise turn.
                else
                    arg = 0;
                end

                turner(row,col,arg);  % Turn the piece.
            case 'p'
                pbt_call;  % This will set to pause. Next set new ...
                set([S.fig,S.pbt],'keypressfcn',@fig_kpfcn2)% Keypressfcn 
            case 'n'
                quit_check;  % User might want to quit the game.
            otherwise
        end

        S.STPTMR = 0;  % Unblock the timer.
    end

