% -------------------------------------------------------------------------
disp('  Create materials...')
% -------------------------------------------------------------------------

material_case = 'hollmann_example'; % vacuum , hollmann_example

switch material_case
    case 'vacuum'
disp('vacuum case')

epsilon_x = ep0 * ones( domain.nx , domain.ny , domain.nz ) ;
epsilon_y = ep0 * ones( domain.nx , domain.ny , domain.nz ) ;
epsilon_z = ep0 * ones( domain.nx , domain.ny , domain.nz ) ;

inv_epsilon_x = 1/ep0 * ones( domain.nx , domain.ny , domain.nz ) ;
inv_epsilon_y = 1/ep0 * ones( domain.nx , domain.ny , domain.nz ) ;
inv_epsilon_z = 1/ep0 * ones( domain.nx , domain.ny , domain.nz ) ;

mu_x = mu0 * ones( domain.nx , domain.ny , domain.nz ) ;
mu_y = mu0 * ones( domain.nx , domain.ny , domain.nz ) ;
mu_z = mu0 * ones( domain.nx , domain.ny , domain.nz ) ;

inv_mu_x = 1/mu0 * ones( domain.nx , domain.ny , domain.nz ) ;
inv_mu_y = 1/mu0 * ones( domain.nx , domain.ny , domain.nz ) ;
inv_mu_z = 1/mu0 * ones( domain.nx , domain.ny , domain.nz ) ;

    case 'hollmann_example'

disp('hollmann example')

volume_2004_hollmann % Create V

epsilon_x = ep0 .* V.^2 ;
epsilon_y = ep0 .* V.^2 ;
epsilon_z = ep0 .* V.^2 ;

inv_epsilon_x = 1./epsilon_x ;
inv_epsilon_y = 1./epsilon_y ;
inv_epsilon_z = 1./epsilon_z ;

mu_x = mu0 * ones( domain.nx , domain.ny , domain.nz ) ;
mu_y = mu0 * ones( domain.nx , domain.ny , domain.nz ) ;
mu_z = mu0 * ones( domain.nx , domain.ny , domain.nz ) ;

inv_mu_x = 1/mu0 * ones( domain.nx , domain.ny , domain.nz ) ;
inv_mu_y = 1/mu0 * ones( domain.nx , domain.ny , domain.nz ) ;
inv_mu_z = 1/mu0 * ones( domain.nx , domain.ny , domain.nz ) ;
        
    otherwise
        disp('Unknown case...')
        return
end
% -------------------------------------------------------------------------
