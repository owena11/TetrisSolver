
    function [] = fig_kp_customfcn(k)
    global S;
    % Figure (and pushbutton) keypressfcn
        S.STPTMR = 1;  % Stop timer interrupts.  See GAME_STEP


        col = ceil(S.CUR/10); % S.CUR defined in play_tet.
        row = rem(S.CUR-1,10) + 1;  % These index into board matrix.

        switch k
           case 1
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
            case -1
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
            case 2

                    arg = 0;
 
                turner(row,col,arg);  % Turn the piece.
            otherwise
        end

        S.STPTMR = 0;  % Unblock the timer.
    end

