
    function [] = mover(N)
    global S;
    % Common task. Moves a piece on the board.
        S.BRDMAT(S.CUR) = false; % S.CUR, S.COL defined in play_tet.
        S.BRDMAT(S.CUR+N) = true; % All checks should be done already.
        S.CUR = S.CUR + N;
        set([S.pch(S.CUR-N),S.pch(S.CUR)],...
            {'facecolor'},{'w';'w';'w';'w';'flat';'flat';'flat';'flat'},...
            {'edgecolor'},{'w';'w';'w';'w';'none';'none';'none';'none'},...
            {'cdata'},{[];[];[];[];S.COL;S.COL;S.COL;S.COL})
    end
