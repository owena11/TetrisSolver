function complete = mover_custom(N)
% Mover_Custom attempts to move a piece left or right, if this cannot be
% achieved the function will return false.


% Complete indicates whether or not the object was moved
global S;
S.STPTMR = 1;  % Stop timer interrupts.  See GAME_STEP

direction = sign(N); % Are we moving left (-1) of right (+1)?
%row = ceil(S.CUR/10); % % Y Positions
col = rem(S.CUR-1,10) + 1;  % X Positions

% Can we complete the movement?
if isequal(direction,-1)
      ur = unique(col);
      mr = min(ur);
      if mr + N < 0
          complete = false;
          S.STPTMR = 0;
          return
      end
else
      ur = unique(col);
      mr = max(ur);
      if mr + N > 9
          complete = false;
          S.STPTMR = 0;
          return
      end
end

% We reached this point, therefore the move is legal
complete = true;
% Common task. Moves a piece on the board.
S.BRDMAT(S.CUR) = false; % S.CUR, S.COL defined in play_tet.
S.BRDMAT(S.CUR+N) = true; % All checks should be done already.
S.CUR = S.CUR + N;
set([S.pch(S.CUR-N),S.pch(S.CUR)],...
    {'facecolor'},{'w';'w';'w';'w';'flat';'flat';'flat';'flat'},...
    {'edgecolor'},{'w';'w';'w';'w';'none';'none';'none';'none'},...
    {'cdata'},{[];[];[];[];S.COL;S.COL;S.COL;S.COL})
S.STPTMR = 1;
end
