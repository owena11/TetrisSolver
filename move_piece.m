function [new_S valid] = move_piece(state, Dest)

x1 = state.CUR(1);

[r1 c1] = ind2sub( [10 20], x1 );

Init = r1;

NumMove =  Dest - Init; 

<<<<<<< HEAD
for ii = 1:abs(NumMove)
=======

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
>>>>>>> 7db53da8ab85f375437bb23378e81c2039137f74
    
    if (NumMove<0)
        
        [new_S valid] = trymove(state, -1);
        
    else
        
        [new_S valid] = trymove(state, 1);
               
    end
    
    if (~valid), return; end
    
end

valid = 1;
