% -------------------------------------------------------------------------
% Plot Magnitude using slice function
% -------------------------------------------------------------------------

makegift = 1 ;
h = figure(2);
axis tight manual % this ensures that getframe() returns a consistent size
set(gcf, 'Position', get(0, 'Screensize'));
filename = '.\results\example2.gif';
% for n = 1:0.5:5
    
% Emag = ( Ex.^2 + Ey.^2 + Ez.^2 ) ;%.^ 0.5 ;

% slice( Emag , domain.nx/2 , domain.ny/2 , domain.nz/2 )
% Emag(end/2,:,:) = mat2gray( Ex(end/2,:,:) ) ;
% Emag(:,end/2,:) = mat2gray( Ey(:,end/2,:)) ;
% Emag(:,:,end/2) = mat2gray( Ez(:,:,end/2) );

Emag(end/2,:,:) = ( Ex(end/2,:,:) ) ;
Emag(:,end/2,:) = ( Ey(:,end/2,:)) ;
Emag(:,:,end/2) = ( Ez(:,:,end/2) );
% slice( Emag , domain.nx/2 , domain.ny/2 ,domain.nz/2)
slice( abs(Emag) , domain.nx/2 , domain.ny/2 ,domain.nz/2)
xlabel('x')
ylabel('y')
zlabel('z')

colormap jet

drawnow
if makegift == 1
    % Capture the plot as an image 
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if nt == 1 
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
      imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
end
