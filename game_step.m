

    function [] = game_step(varargin)
    global S;
    % Timerfcn, advances the current piece down the board
        if S.STPTMR && nargin  % Only timer calls with args...
            return  % So that timer can't interrupt FIG_KPFCN!
        end

        col = ceil(S.CUR/10); % S.CUR defined in play_tet.
        row = rem(S.CUR-1,10) + 1;  % These are for the board matrix.

        if any(col==1)  % Piece is at the bottom of the board.
            stop_tet;
            check_rows;
            play_tet;
        else
            ur = unique(row);  % Check to see if we can drop it down

            for kk = 1:length(ur)
                if (S.BRDMAT(ur(kk),min(col(row==ur(kk)))-1))
                    stop_tet;
                    check_rows;
                    play_tet;
                    return
                end
            end

            mover(-10)  % O.k. to drop the piece... do it.
        end
    end
