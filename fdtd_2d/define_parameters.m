% define_parameters
disp('    script-> define_parameters')

% maximum time-steps:
number_of_time_steps = 6500; 

% factor to CFL condition:
courant_factor = 0.9;

% spatial increments
dx = 41.17 * 1e-9 ;
dy = dx ;

% free space constant parameters
eps_0 = 8.854187817e-12; % permittivity               
mu_0  = 4*pi*1e-7;       % permeability                   
c = 1/sqrt(mu_0*eps_0);  % speed of light

% time step in seconds
dt = 1/(c*sqrt((1/dx^2)+(1/dy^2)));
dt = courant_factor*dt;

% time array
time = ([1:number_of_time_steps]-0.5)*dt;

% -------------------------------------------------------------------------
% domain in term of spatial geometry of skin
fdtd_domain.min_x = 0.0 ;
fdtd_domain.max_x = 102.94 * 1e-6 ;
fdtd_domain.min_y = 0.0 ;
fdtd_domain.max_y = 75 * 1e-6 ;
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% boudary PML
boundary.type_xn = 'pml';
is_pml_xn        = true ;
boundary.pml_number_of_cells_xn = 15;

boundary.type_xp = 'pml';
is_pml_xp        = true ;
boundary.pml_number_of_cells_xp = 15;

boundary.type_yn = 'pml';
is_pml_yn        = true ;
boundary.pml_number_of_cells_yn = 15;

boundary.type_yp = 'pml';
is_pml_yp        = true ;
boundary.pml_number_of_cells_yp = 15;

boundary.pml_order = 2;
boundary.pml_R_0 = 1e-8;

n_pml_xn = boundary.pml_number_of_cells_xn;
n_pml_xp = boundary.pml_number_of_cells_xp;
n_pml_yn = boundary.pml_number_of_cells_yn;
n_pml_yp = boundary.pml_number_of_cells_yp;
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% domain adding PML 
fdtd_domain.min_x = fdtd_domain.min_x - dx * n_pml_xn ;
fdtd_domain.min_y = fdtd_domain.min_y - dy * n_pml_yn ;
fdtd_domain.max_x = fdtd_domain.max_x + dx * n_pml_xp ;
fdtd_domain.max_y = fdtd_domain.max_y + dy * n_pml_yp ;
% -------------------------------------------------------------------------

% space size
fdtd_domain.size_x = fdtd_domain.max_x - fdtd_domain.min_x;
fdtd_domain.size_y = fdtd_domain.max_y - fdtd_domain.min_y;

% cells number x and y directions
nx = round(fdtd_domain.size_x/dx);  
ny = round(fdtd_domain.size_y/dy);

% adjust domain size by snapping to cells
fdtd_domain.size_x = nx * dx;
fdtd_domain.size_y = ny * dy;

fdtd_domain.max_x = fdtd_domain.min_x + fdtd_domain.size_x;
fdtd_domain.max_y = fdtd_domain.min_y + fdtd_domain.size_y;

% some frequently used auxiliary parameters 
nxp1 = nx+1;  nxm1 = nx-1; nxm2 = nx-2;
nyp1 = ny+1;  nym1 = ny-1; nym2 = ny-2; 

% 
% TMz components
eps_r_z     = ones (nxp1, nyp1);
mu_r_x      = ones (nxp1, ny);
mu_r_y      = ones (nx  , nyp1);
sigma_e_z   = zeros(nxp1, nyp1);
sigma_m_x   = zeros(nxp1, ny);
sigma_m_y   = zeros(nx  , nyp1);


disp('eps_r_z: refraction index');
% Add geometry by refraction index
Geo = Geometria2D(0,tipo_geometria) ;
eps_r_z = eps_r_z .* (Geo.^2) ;
                   
% -------------------------------------------------------------------------