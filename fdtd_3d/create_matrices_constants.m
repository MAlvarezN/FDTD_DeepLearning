% -------------------------------------------------------------------------
disp('  Create matrices constants of Ex')
% -------------------------------------------------------------------------
C_exe  = ones( domain.nx , domain.ny , domain.nz ) ;
C_exhz = + domain.dt / domain.dy * inv_epsilon_x ; 
C_exhy = - domain.dt / domain.dz * inv_epsilon_x ;
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
disp('  Create matrices constants of Ey')
% -------------------------------------------------------------------------
C_eye  = ones( domain.nx , domain.ny , domain.nz ) ;
C_eyhx = + domain.dt / domain.dz * inv_epsilon_y ;
C_eyhz = - domain.dt / domain.dx * inv_epsilon_y ;
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
disp('  Create matrices constants of Ez')
% -------------------------------------------------------------------------
C_eze  = ones( domain.nx , domain.ny , domain.nz ) ;
C_ezhy = + domain.dt / domain.dx * inv_epsilon_z ;
C_ezhx = - domain.dt / domain.dy * inv_epsilon_z ;
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
disp('  Create matrices constants of Hx')
% -------------------------------------------------------------------------
C_hxh  = ones( domain.nx , domain.ny , domain.nz ) ;
C_hxez = - domain.dt / domain.dy * inv_mu_x ;
C_hxey = + domain.dt / domain.dz * inv_mu_x ;
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
disp('  Create matrices constants of Hy')
% -------------------------------------------------------------------------
C_hyh  = ones( domain.nx , domain.ny , domain.nz ) ;
C_hyex = - domain.dt / domain.dz * inv_mu_y ;
C_hyez = + domain.dt / domain.dx * inv_mu_y ;
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
disp('  Create matrices constants of Hz')
% -------------------------------------------------------------------------
C_hzh  = ones( domain.nx , domain.ny , domain.nz ) ;
C_hzey = - domain.dt / domain.dx * inv_mu_z ;
C_hzex = + domain.dt / domain.dy * inv_mu_z ;
% -------------------------------------------------------------------------
