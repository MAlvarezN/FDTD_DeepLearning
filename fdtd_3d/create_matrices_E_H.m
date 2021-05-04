% -------------------------------------------------------------------------
%  Create matrices of the field E
% -------------------------------------------------------------------------
Ex = zeros( domain.nx , domain.ny , domain.nz ) ;
Ey = zeros( domain.nx , domain.ny , domain.nz ) ;
Ez = zeros( domain.nx , domain.ny , domain.nz ) ;

disp('Matrices E... done!')        
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
%  Create matrices of the field H
% -------------------------------------------------------------------------
Hx = zeros( domain.nx , domain.ny , domain.nz ) ;
Hy = zeros( domain.nx , domain.ny , domain.nz ) ;
Hz = zeros( domain.nx , domain.ny , domain.nz ) ;

disp('Matrices H... done!')
% -------------------------------------------------------------------------

Emag = zeros( domain.nx , domain.ny , domain.nz ) ;