% -------------------------------------------------------------------------
if nt <= 100
    
% Exponential source
x = linspace( 0 , 1 , domain.nx ) * domain.dx ;
y = linspace( 0 , 1 , domain.ny ) * domain.dy ;

x0 = .5 * domain.dx ; 
y0 = .5 * domain.dy ; 

[X,Y] = meshgrid(x,y) ;

E0 = 1 ;

Esrc = E0 * exp(-( (X-x0).^2 + (Y-y0).^2 )/1e-6 ) ;
f_t = exp(- domain.dt * (nt-1) * 1e10) ; % Decaer en tiempo
% figure, imagesc(Esrc),colorbar

Ez(35,35,50) = 5*sin(27*2*pi*nt/nT) ;
Ey(50,50,75) = 3*sin(25*2*pi*nt/nT) ;
Ex(50,50,75) = 7*sin(23*2*pi*nt/nT) ;
% Ez (:,:,end/2) = Ez (:,:,end/2) + Esrc .* f_t ;
% Ez (:,:, end/2 ) = Ez (:,:, end/2 ) + Esrc .* f_t ;
% Ey (:, end/2+10,: ) = Ey (:, end/2+10,: ) + reshape( Esrc .* f_t , [100     1   100]) ;
% Ex ( end/2+10 ,:,:) = Ex ( end/2+10 ,:,:) +  reshape( Esrc .* f_t , [1     100   100]); 
% Ex (:,5, : ) = Ez (:,5, : ) + reshape( Esrc .* f_t , [100     1   100]);
% Ey (5,:, : ) = Ez (5,:, : ) + reshape( Esrc .* f_t , [1     100   100]);

end



return
% Only for test
if nt == 10

    Ex( domain.nx/2-3:domain.nx/2+3,...
        domain.ny/2-3:domain.ny/2+3,...
        domain.nz/2-3:domain.nz/2+3)    = 1 ;

end
% -------------------------------------------------------------------------