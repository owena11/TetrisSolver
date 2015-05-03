function cost = costfn_holes(S)

hole_cost = -10;
board = double(S.BRDMAT);
% board = randi(2, 10, 20) - 1;
cc = bwconncomp(1 - board, 4);

cost = (cc.NumObjects - 1) * hole_cost;

1;