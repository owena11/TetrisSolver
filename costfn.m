function score = costfn(state, pos, rot)
% Given current state and proposed [pos rot], evaluate
% the result of dropping the piece if it was first placed
% at [pos rot]. Higher = better.

score = pos; % Dummy agent: always prefer moving to the right
