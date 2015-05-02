
    function [X] = digits(varargin)
    global S;
    global r_col;
    % To create a display, pass in the pixel height desired, the number of
    % digits to create, the offset of the text and string. To update the
    % display, pass in a string representation of the number to display...
    %
    % Example:
    % X = digits(80,2,0,'Points'); % 80 pix tall, 2 digits, 0 offset.
    % for ii = 1:100,digits(X,sprintf('%i',ii)),pause(.1),end

        if isstruct(varargin{1})
            transcriber(varargin{1},varargin{2});  % Change display.
            return
        else
            X.N = varargin{1}; % The pixel height of the numbers.
            X.M = varargin{2}; % The number of numbers.
            X.D = varargin{3}; % The offset of the text, in pixels.
            X.T = varargin{4}; % The display label.
        end

        X.ax = axes('units','pix',...
                    'pos',[0,0,X.N/1.7*X.M,X.N],...
                    'xtick',[],'ytick',[],...
                    'xlim',[0,X.M],'ylim',[0,1.7],...
                    'color',r_col,...
                    'xcolor',r_col,...
                    'ycolor',r_col,...
                    'visible','off');  % Digits displayed on this axes.
        X.tx = text('units','pixels',...
                    'pos',[X.D,X.N+10],...
                    'string',X.T,...
                    'backgroundc','none',...
                    'vertical','baselin',...
                    'fontw','bold',...
                    'fontname','fixedwidth',...
                    'fontsize',20,...
                    'color',[0.39216 .27059 .07451]);  % Create label.
        % X.P holds the basic patch pattern as a template.
        X.P{1}(1) = patch([.175 .275 .725 .825 .725 .275 .175],...
                          [.150 .050 .050 .150 .250 .250 .150],'k');
        X.P{1}(2) = patch([.175 .275 .725 .825 .725 .275 .175],...
                          [.150 .050 .050 .150 .250 .250 .150]+.7,'k');
        X.P{1}(3) = patch([.175 .275 .725 .825 .725 .275 .175],...
                          [.150 .050 .050 .150 .250 .250 .150]+1.4,'k');
        X.P{1}(4) = patch([.150 .050 .050 .150 .250 .250 .150],...
                          [.175 .275 .725 .825 .725 .275 .175],'k');
        X.P{1}(5) = patch([.150 .050 .050 .150 .250 .250 .150],...
                          [.175 .275 .725 .825 .725 .275 .175]+.7,'k');
        X.P{1}(6) = patch([.150 .050 .050 .150 .250 .250 .150]+.70,...
                          [.175 .275 .725 .825 .725 .275 .175],'k');
        X.P{1}(7) = patch([.150 .050 .050 .150 .250 .250 .150]+.70,...
                          [.175 .275 .725 .825 .725 .275 .175]+.70,'k');
        set(X.P{1},'edgecolor','none')

        for ww = 2:X.M
            for yy = 1:7
                X.P{ww}(yy) = patch('xdata',...
                                    get(X.P{1}(yy),'xdata')+(ww-1),...
                                    'ydata',get(X.P{1}(yy),'ydata'),...
                                    'facecolor','k',...
                                    'edgecolor','none');% Making digits!
            end
        end

        X.PAT = {[1 3 4 5 6 7],... % 0.. Hold the pattern to each digit...
                 [6 7],...         % used as an index into X.P
                 [1 2 3 4 7],...   % 2
                 [1 2 3 6 7],...   % 3
                 [2 5 6 7],...     % 4
                 [1 2 3 5 6],...   % 5
                 [1 2 4 5 6],...   % 6
                 [3 6 7],...       % 7
                 1:7,...           % 8
                 [2 3 5 6 7]};     % 9
        transcriber(X,'0')

        
        function [] = transcriber(X,C)
        % This deals with making the numbers. Nested to DIGITS.
            if length(C)>X.M  % Display more digits than available!
                C = repmat('9',1,X.M);
            else
                C = [repmat('!',1,X.M-length(C)),C];  % Pad them to left.
            end

            for xx = 1:X.M
                set(X.P{xx}(:),'facecolor','none') % Clean it up first.

                if ~strcmp('!',C(xx))
                    set(X.P{xx}(X.PAT{str2double(C(xx))+1}),...
                        'facecolor',[.1 .4 .1])  % Set correct display.
                end
            end
        end
    end