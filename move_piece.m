function [new_state valid] = move_piece(state, pos, rot)

valid = true;
new_state = [state [pos; rot]];
