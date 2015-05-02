
    function [] = check_rows()
    global S;
    % Checks if any row(s) needs clearing and clears it (them).
        TF = all(S.BRDMAT); % Finds the rows that are full.

        if any(TF)  % There is a row that needs clearing.
            set(S.pbt,'enable','off')  % Don't allow user to mess it up.
            sm = sum(TF); % How many rows are there?
            B = false(size(S.BRDMAT));  % Temp store to switcheroo.
            B(:,1:20-sm) = S.BRDMAT(:,~TF);
            S.BRDMAT = B;
            TF1 = find(TF); % We only need to drop those rows above.
            L = length(TF1);
            TF = TF1-(0:L-1);
            S.CURLNS = S.CURLNS + L;
            digits(S.DSPDIG(1),sprintf('%i',S.CURLNS))  % Lines display
            S.CURSCR = S.CURSCR+S.PNTVCT(L)*S.CURLVL;
            digits(S.DSPDIG(2),sprintf('%i',S.CURSCR))  % Points display
            play(S.plr,[6000 length(S.SOUNDS.y)])

            for kk = 1:L % Make these rows to flash for effect.
                set(S.pch(:,TF1(:)),'facecolor','r');
                pause(.1)
                set(S.pch(:,TF1(:)),'facecolor','g');
                pause(.1)
            end

            for kk = 1:L % 'Delete' these rows.
                set(S.pch(:,TF(kk):19),...
                    {'facecolor';'edgecolor';'cdata'},...
                    get(S.pch(:,TF(kk)+1:20),...
                    {'facecolor';'edgecolor';'cdata'}));
            end

            if (floor(S.CURLNS/S.CHGLVL)+1)>S.CURLVL % Level display check.
                S.CURLVL = S.CURLVL + 1;
                digits(S.DSPDIG(3),sprintf('%i',S.CURLVL))
                ND = round(get(S.tmr,'startdelay')*S.LVLFAC*1000)/1000;
                ND = max(ND,.001);
                set(S.tmr,'startdelay',ND,'period',ND) % Update timer
            end

            if S.CURSCR>=S.CURHSC  % So that figure name is current.
                S.CURHSC = S.CURSCR;
                set(S.fig,'name',...
                    sprintf('Tetris High Score - %i',S.CURHSC))
            end

            set(S.pbt,'enable','on')  % Now user is o.k. to go.
        else
            if ~isplaying(S.plr)
                play(S.plr,[7500 8500])  % Play our plunk sound.
            end
        end
    end

