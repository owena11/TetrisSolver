function [ state ]  = add_piece( state, shapeN )


state.PRVNUM  = shapeN;

state.PNM = state.PRVNUM; % Hold this for keypresfcn.
state.CUR = state.PCHIDX{state.PRVNUM}; % Current loc. of current piece.
state.COL = state.PCHCLR{state.PRVNUM}; % Transfer correct color.
state.CUR = state.CUR - 20;
state.CURROT = 1; % And initial rotation number.
state.BRDMAT(state.CUR) = true;


end

