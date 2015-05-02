function [new_S valid] = move_piece(state, N)


new_S = state;% new_S = S;
arg = 0;
valid = 55;

% Remove block from its current position
new_S.BRDMAT(new_S.CUR) = false; % new_S.CUR, new_S.COL defined in play_tet.

% Compute current row/col values
col = ceil(new_S.CUR/10); % S.CUR defined in play_tet.
row = rem(new_S.CUR-1,10) + 1;  % These index into board matrix.


% Check if left/right movement is possible
switch N
    
    case 1
        % Without this IF, the piece will wrap around!
        if max(row)<=9
            uc = unique(col);  % Check if object to the right.

            for kk = 1:length(uc)
                if (new_S.BRDMAT(max(row(col==uc(kk)))+1,uc(kk)))
                    new_S.STPTMR = 0;
                    return
                end
            end

        end
        
    case 2
        if min(row)>=2
            uc = unique(col);  % Check if object to the left

            for kk = 1:length(uc)
                if (new_S.BRDMAT(min(row(col==uc(kk)))-1,uc(kk)))
                    new_S.STPTMR = 0;
                    return
                end
            end


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
    return;
    
end

%% Implement Rotation part

% Common task. Rotates the pieces once at a time.
% r is reading left/right, c is reading up/down.
% For the switch:  1-I, 2-T, 3-L, 4-J, 5-Z, 6-S, 7-O

switch new_S.PNM % Defined in play_tet.  Turn depends on shape.
    
    case 1  
        
        if any(col>19) || all(col<=2)
            
            valid = 0; 
            return;
            
        else
            
            if new_S.CURROT == 1;
            
                r = [row(2),row(2),row(2),row(2)];
                c = [col(2)-2,col(2)-1,col(2),col(2)+1];
                new_S.CURROT = 2;
            
            elseif all(row>=9)
            
                r = 7:10;
                c = [col(2),col(2),col(2),col(2)];
                new_S.CURROT = 1;
            
            elseif all(row==1)
                
                r = 1:4;
                c = [col(2),col(2),col(2),col(2)];
                new_S.CURROT = 1;
                
            else
                
                r = [row(2)-1,row(2),row(2)+1,row(2)+2];
                c = [col(2),col(2),col(2),col(2)];
                new_S.CURROT = 1;
                
            end
        end
        
    case 2
        if sum(col==1)==3
            valid = 0; return;
        end

        if arg
            new_S.CURROT = mod(new_S.CURROT+1,4)+1;
        end

        switch new_S.CURROT
        
            case 1
                r = [row(2),row(2),row(2),row(2)+1];
                c = [col(2)-1,col(2),col(2)+1,col(2)];
            
            case 2
                if sum(row==1)==3
                    r = [1 2 3 2];
                    c = [col(2),col(2),col(2),col(2)-1];
                else
                    r = [row(2)-1,row(2),row(2),row(2)+1];
                    c = [col(2),col(2),col(2)-1,col(2)];
                end
                
            case 3
                r = [row(2)-1,row(2),row(2),row(2)];
                c = [col(2),col(2),col(2)-1,col(2)+1];
            
            case 4
                if sum(row==10)==3
                    r = [9 9 8 10];
                    c = [col(2)+1,col(2),col(2),col(2)];
                else
                    r = [row(2)-1,row(2),row(2),row(2)+1];
                    c = [col(2),col(2),col(2)+1,col(2)];
                end
        end

        new_S.CURROT = mod(new_S.CURROT,4) + 1;
        
    case 3
        
        if sum(col==1)==3
            valid = 0; return;
        end

        if arg
            new_S.CURROT = mod(new_S.CURROT+1,4)+1;
        end

        switch new_S.CURROT
            
            case 1
                r = [row(2),row(2),row(2),row(2)+1];
                c = [col(2)+1,col(2),col(2)-1,col(2)-1];
            
            case 2
                if sum(row==1)==3
                    r = [1:3 1];
                    c = [col(2),col(2),col(2),col(2)-1];
                else
                    r = [row(2)-1,row(2),row(2)-1,row(2)+1];
                    c = [col(2),col(2),col(2)-1,col(2)];
                end
                
            case 3
                r = [row(2)-1,row(2),row(2),row(2)];
                c = [col(2)+1,col(2),col(2)+1,col(2)-1];
            
            case 4
                if sum(row==10)==3
                    r = [10 9 10 8];
                    c = [col(2)+1,col(2),col(2),col(2)];
                else
                    r = [row(2)-1,row(2),row(2)+1,row(2)+1];
                    c = [col(2),col(2),col(2),col(2)+1];
                end
        end

        new_S.CURROT = mod(new_S.CURROT,4) + 1;
    
    case 4
        if sum(col==1)==3
            valid = 0; return;
        end

        if arg
            new_S.CURROT = mod(new_S.CURROT+1,4)+1;
        end

        switch new_S.CURROT
            case 1
                r = [row(2),row(2),row(2),row(2)+1];
                c = [col(2)-1,col(2),col(2)+1,col(2)+1];
            case 2
                if sum(row==1)==3
                    r = [1 2 3 3];
                    c = [col(2),col(2),col(2),col(2)-1];
                else
                    r = [row(2)-1,row(2),row(2)+1,row(2)+1];
                    c = [col(2),col(2),col(2),col(2)-1];
                end
            case 3
                r = [row(2)-1,row(2),row(2),row(2)];
                c = [col(2)-1,col(2),col(2)-1,col(2)+1];
            case 4
                if sum(row==10)==3
                    r = [8 9 8 10];
                    c = [col(2)+1,col(2),col(2),col(2)];
                else
                    r = [row(2)-1,row(2),row(2)-1,row(2)+1];
                    c = [col(2),col(2),col(2)+1,col(2)];
                end
        end

        new_S.CURROT = mod(new_S.CURROT,4) + 1;
        
    case 5
        
        if any(col(2)>19) || sum(col==1)==2
            valid = 0; return;
        
        elseif new_S.CURROT==1;
            r = [row(2),row(2),row(2)-1,row(2)-1];
            c = [col(2)+1,col(2),col(2),col(2)-1];
            new_S.CURROT = 2;
        else
            if sum(row==10)==2
                r = [10 9 9 8];
                c = [col(2)-1,col(2)-1,col(2),col(2)];
            else
                r = [row(2)-1,row(2),row(2),row(2)+1];
                c = [col(2),col(2),col(2)-1,col(2)-1];
            end

            new_S.CURROT = 1;
        end
        
    case 6
        
        if any(col(2)>19)|| sum(col==1)==2
            
            valid = 0; return;
            
        elseif new_S.CURROT==1;
            r = [row(2)+1,row(2),row(2)+1,row(2)];
            c = [col(2)-1,col(2),col(2),col(2)+1];
            new_S.CURROT = 2;
        else
            if sum(row==1)==2
                r = [1 2 2 3];
                c = [col(2)-1,col(2)-1,col(2),col(2)];
            else
                r = [row(2)-1,row(2),row(2),row(2)+1];
                c = [col(2)-1,col(2),col(2)-1,col(2)];
            end
            
            new_S.CURROT = 1;
        end
        
    otherwise
        valid = 0; return; % The O piece.
end

ind = r + (c-1)*10; % Holds new piece locationnew_S.
tmp = new_S.CUR; % Want to call SET last! new_S.CUR defined in play_tet.
new_S.BRDMAT(new_S.CUR) = false;

if any(new_S.BRDMAT(ind)) % Check if any pieces are in the way.
    new_S.BRDMAT(new_S.CUR) = true;
    valid = 0; return;
end

new_S.BRDMAT(ind) = true;
new_S.CUR = ind; % new_S.CUR, new_S.COL defined in play_tet.
set([new_S.pch(tmp),new_S.pch(ind)],...
    {'facecolor'},{'w';'w';'w';'w';'flat';'flat';'flat';'flat'},...
    {'edgecolor'},{'w';'w';'w';'w';'none';'none';'none';'none'},...
    {'cdata'},{[];[];[];[];new_S.COL;new_S.COL;new_S.COL;new_S.COL});
end

