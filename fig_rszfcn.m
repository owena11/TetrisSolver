

    function [] = fig_rszfcn(varargin)
    % The figure's resizefcn
    global S;
        pos = get(S.fig,'pos');  % Don't allow distorted shapes...
        rat = 720/650; % This ratio will be hard-coded. Original pix size.
        set(S.fig,'pos',[pos(1) pos(2) pos(4)/rat, pos(4)]);
    end