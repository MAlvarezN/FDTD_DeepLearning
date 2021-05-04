% -------------------------------------------------------------------------
function S = my_sphere( r )
% Make an sphere x^2 + y^2 + z^2 <= r^2
% Given a raious make an sphere insede a cube

if nargin == 0
    r = 100 ; % Radious in pixels
end
% Define domain
x = -r:1:r;
% y = 0:1:10;
% z = 0:1:10;
% [X,Y,Z] = meshgrid(x,y,z);
[X,Y,Z] = meshgrid(x);
S = X.^2 + Y.^2 + Z.^2 <= r^2 ;

% k = 1
% figure,
%     imagesc(G(:,:,k))
   
if nargout == 0
    figure,
    for k = 1 :  size(S,3)    
        imagesc(S(:,:,k))
        drawnow
        pause(.1)
    end
    S = [] ;
end

end
% -------------------------------------------------------------------------