
function [] = make_preview(varargin)
global S;
global X;
global Y;
% This function chooses which piece is going next and displays it.
if nargin
    S.PRVNUM = varargin{1};
else
    S.PRVNUM = ceil(rand*7); % Randomly choose one of the pieces.
end

if ~isempty(S.CURPRV)
    delete(S.CURPRV) % Delete previous preview.
end

if S.MAKPRV
    C = S.PCHCLR{S.PRVNUM};  % User wants to show the preview.
else
    C = r_col;
end

for kk = 1:4  % Create a new preview.
    S.CURPRV(kk) = patch(X+S.PRVPOS{S.PRVNUM}(1,kk),...
        Y+S.PRVPOS{S.PRVNUM}(2,kk),...
        C,'edgecolor','none',...
        'parent',S.axs(1));
end
end
