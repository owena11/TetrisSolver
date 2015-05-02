    function [] = stop_tet()
    global S;
    % Sets the correct callbacks and timer to stop game
        stop(S.tmr)
        set([S.fig,S.pbt],'keypressfcn','fprintf('''')')
    end
