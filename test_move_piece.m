figure(1);
sc(S.BRDMAT);

for p = 1:10
    for r = 0:3
        [newS valid] = move_piece(S, p, r);
        valid
        figure(1); sc(newS.BRDMAT); drawnow
        pause(1);
    end
end
