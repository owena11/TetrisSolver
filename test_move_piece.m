figure(1);
imagesc(S.BRDMAT);

MAX_ROT = [2, 4, 4, 4, 2, 2, 1] - 1;
for r = 0:MAX_ROT(S.PNM)
    for p = 1:10
        
        [newS valid] = move_piece(S, p, r);
        valid
        figure(1); imagesc(newS.BRDMAT); drawnow
%         pause(0.5);
    end
end
