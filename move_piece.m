function [new_S valid] = move_piece(state, Dest)

x1 = state.CUR(1);

[r1 c1] = ind2sub( [10 20], x1 );

Init = r1;

NumMove =  Dest - Init;

for ii = 1:abs(NumMove)

    if (NumMove<0)

        [new_S valid] = trymove(state, -1);

    else

        [new_S valid] = trymove(state, 1);

    end

    if (~valid), return; end

end

valid = 1;
