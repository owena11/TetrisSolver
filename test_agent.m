figure(1);
s = tic;
state = [];
pos = 1;
rot = 1;
[best_pos best_rot best_score k] = agent(S, pos, rot,[], 1);

time = toc(s);
