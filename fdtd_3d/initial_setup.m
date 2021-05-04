


mu0 = 4*pi*1e-7 ; % Permeability [H/m]
ep0 = 8.85*1e-12 ; % Permittivity [F/m]
c0 = 3*1e8 ;% Light Speed approx. 3*10^8 [m/s]

domain.nx = 100 ; % number of pixels in x direction
domain.ny = 100 ;
domain.nz = 100 ;

domain.dx = 1e-3 ; 
domain.dy = 1e-3 ;
domain.dz = 1e-3 ;
% By CFL condition:
domain.dt = .9 * (1/c0) * 1/sqrt( (1/domain.dx)^2 + (1/domain.dy)^2 + (1/domain.dz)^2 ) ;
