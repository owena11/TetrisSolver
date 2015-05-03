% Implement movement
function [new_S valid] = trymove(state, N)

new_S = state;% new_S = S;
arg = 0;
valid = 0;

% Remove block from its current position
new_S.BRDMAT(new_S.CUR) = false; % new_S.CUR, new_S.COL defined in play_tet.

% Compute current row/col values
col = ceil(new_S.CUR/10); % S.CUR defined in play_tet.
row = rem(new_S.CUR-1,10) + 1;  % These index into board matrix.


% Check if left/right movement is possible
switch N
    
    case 1
        % Without this IF, the piece will wrap around!
        if ~(max(row)<=9)
            %             uc = unique(col);  % Check if object to the right.
            %
            %             for kk = 1:length(uc)
            %                 if (new_S.BRDMAT(max(row(col==uc(kk)))+1,uc(kk)))
            %                     new_S.STPTMR = 0;
            %                     new_S.BRDMAT(new_S.CUR) = true;
            %                     return
            %                 end
            %             end
            valid = 0;
            new_S.BRDMAT(new_S.CUR) = true;
            return;
            
            
        end
        
    case -1
        if ~(min(row)>=2)
            %             uc = unique(col);  % Check if object to the left
            %
            %             for kk = 1:length(uc)
            %                 if (new_S.BRDMAT(min(row(col==uc(kk)))-1,uc(kk)))
            %                     new_S.STPTMR = 0;
            %                     new_S.BRDMAT(new_S.CUR) = true;
            %                     return
            %                 end
            %             end
            valid = 0;
            new_S.BRDMAT(new_S.CUR) = true;
            return;
            
        end
        
end


% Check is movement is possible (catch for obstruction)
if ( all(new_S.BRDMAT(new_S.CUR+N)  == 0 ))
    
    new_S.BRDMAT(new_S.CUR+N) = true; % All checks should be done already.
    new_S.CUR = new_S.CUR + N;
    
    % Compute current row/col values
    col = ceil(new_S.CUR/10); % S.CUR defined in play_tet.
    row = rem(new_S.CUR-1,10) + 1;  % These index into board matrix.
    
    
else
    
    valid = 0;
    new_S.BRDMAT(new_S.CUR) = true;
    return;
    
end
valid = 1;

