    function [] = start_tet()
    global S;
    % Sets the correct callbacks and timer for a new game
        set([S.fig,S.pbt],'keypressfcn',@fig_kpfcn)
        start(S.tmr)
    end

