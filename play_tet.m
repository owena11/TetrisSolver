function [] = play_tet()
global S;
%S.PRVNUM = 7;
% Picks a next piece and puts the preview in correct axes.
S.PNM = S.PRVNUM; % Hold this for keypresfcn.
S.CUR = S.PCHIDX{S.PRVNUM}; % Current loc. of current piece.
S.CUR = S.CUR - 10;
S.COL = S.PCHCLR{S.PRVNUM}; % Transfer correct color.
S.CURROT = 1; % And initial rotation number.
set(S.pch(S.CUR),'facec','flat','cdata',S.COL,'edgecol','none')

if any(S.BRDMAT(S.CUR))
    disp('....Game over....')
    clean_tet;  % Clean up the board.
    set([S.fig,S.pbt],'keypressfcn',@fig_kpfcn2)
    return
else
    S.BRDMAT(S.CUR) = true; % Now update the matrix...
end

% Move a piece right when it spawns
%possible = mover_custom(4);

make_preview;  % Set up the next piece.
start_tet;     % Start the timer.

[best_pos best_rot best_score k] = agent(S, [], [],[], 1);
disp(k);
for i = 1: length(k)
   fig_kp_customfcn(k(i));
           
end


end
