
    function [] = turner(row,col,arg)
    
   global S;
    % Common task. Rotates the pieces once at a time.
    % r is reading left/right, c is reading up/down.
    % For the switch:  1-I,2-T,3-L,4-J,5-Z,6-S,7-O
        switch S.PNM % Defined in play_tet.  Turn depends on shape.
            case 1  
                if any(col>19) || all(col<=2)
                    return
                else
                    if S.CURROT == 1;
                        r = [row(2),row(2),row(2),row(2)];
                        c = [col(2)-2,col(2)-1,col(2),col(2)+1];
                        S.CURROT = 2;
                    elseif all(row>=9)
                        r = 7:10;
                        c = [col(2),col(2),col(2),col(2)];
                        S.CURROT = 1;
                    elseif all(row==1)
                        r = 1:4;
                        c = [col(2),col(2),col(2),col(2)];
                        S.CURROT = 1;
                    else
                        r = [row(2)-1,row(2),row(2)+1,row(2)+2];
                        c = [col(2),col(2),col(2),col(2)];
                        S.CURROT = 1;
                    end
                end
            case 2
                if sum(col==1)==3
                    return
                end

                if arg
                    S.CURROT = mod(S.CURROT+1,4)+1;
                end

                switch S.CURROT
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

                S.CURROT = mod(S.CURROT,4) + 1;
            case 3
                if sum(col==1)==3
                    return
                end

                if arg
                    S.CURROT = mod(S.CURROT+1,4)+1;
                end

                switch S.CURROT
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

                S.CURROT = mod(S.CURROT,4) + 1;
            case 4
                if sum(col==1)==3
                    return
                end

                if arg
                    S.CURROT = mod(S.CURROT+1,4)+1;
                end

                switch S.CURROT
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

                S.CURROT = mod(S.CURROT,4) + 1;
            case 5
                if any(col(2)>19) || sum(col==1)==2
                    return
                elseif S.CURROT==1;
                    r = [row(2),row(2),row(2)-1,row(2)-1];
                    c = [col(2)+1,col(2),col(2),col(2)-1];
                    S.CURROT = 2;
                else
                    if sum(row==10)==2
                        r = [10 9 9 8];
                        c = [col(2)-1,col(2)-1,col(2),col(2)];
                    else
                        r = [row(2)-1,row(2),row(2),row(2)+1];
                        c = [col(2),col(2),col(2)-1,col(2)-1];
                    end

                    S.CURROT = 1;
                end
            case 6
                if any(col(2)>19)|| sum(col==1)==2
                    return
                elseif S.CURROT==1;
                    r = [row(2)+1,row(2),row(2)+1,row(2)];
                    c = [col(2)-1,col(2),col(2),col(2)+1];
                    S.CURROT = 2;
                else
                    if sum(row==1)==2
                        r = [1 2 2 3];
                        c = [col(2)-1,col(2)-1,col(2),col(2)];
                    else
                        r = [row(2)-1,row(2),row(2),row(2)+1];
                        c = [col(2)-1,col(2),col(2)-1,col(2)];
                    end
                    S.CURROT = 1;
                end
            otherwise
                return % The O piece.
        end

        ind = r + (c-1)*10; % Holds new piece locations.
        tmp = S.CUR; % Want to call SET last! S.CUR defined in play_tet.
        S.BRDMAT(S.CUR) = false;

        if any(S.BRDMAT(ind)) % Check if any pieces are in the way.
            S.BRDMAT(S.CUR) = true;
            return
        end

        S.BRDMAT(ind) = true;
        S.CUR = ind; % S.CUR, S.COL defined in play_tet.
        set([S.pch(tmp),S.pch(ind)],...
            {'facecolor'},{'w';'w';'w';'w';'flat';'flat';'flat';'flat'},...
            {'edgecolor'},{'w';'w';'w';'w';'none';'none';'none';'none'},...
            {'cdata'},{[];[];[];[];S.COL;S.COL;S.COL;S.COL});
    end

