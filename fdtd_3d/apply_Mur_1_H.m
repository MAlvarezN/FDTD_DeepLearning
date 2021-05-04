% -------------------------------------------------------------------------
% Mur first Order
% -------------------------------------------------------------------------

% Mur First Order constant
cte_mur1     = ( c0 * domain.dt - domain.dx ) /...
              ( c0 * domain.dt + domain.dx ) ;

% -------------------------------------------------------------------------
% Boundary final position H:
% -----------------------------
Hz( end , : , : ) = mur1( Hz_n_1_N_1 , Hz_n_N_0 , Hz_n_N_1 , cte_mur1 ) ;
Hx( end , : , : ) = mur1( Hx_n_1_N_1 , Hx_n_N_0 , Hx_n_N_1 , cte_mur1 ) ;
Hy( end , : , : ) = mur1( Hy_n_1_N_1 , Hy_n_N_0 , Hy_n_N_1 , cte_mur1 ) ;

Hz( : , end , : ) = mur1( Hz_n_1_N_1_y , Hz_n_N_0_y , Hz_n_N_1_y , cte_mur1 ) ;
Hx( : , end , : ) = mur1( Hx_n_1_N_1_y , Hx_n_N_0_y , Hx_n_N_1_y , cte_mur1 ) ;
Hy( : , end , : ) = mur1( Hy_n_1_N_1_y , Hy_n_N_0_y , Hy_n_N_1_y , cte_mur1 ) ;

Hz( : , : , end ) = mur1( Hz_n_1_N_1_z , Hz_n_N_0_z , Hz_n_N_1_z , cte_mur1 ) ;
Hx( : , : , end ) = mur1( Hx_n_1_N_1_z , Hx_n_N_0_z , Hx_n_N_1_z , cte_mur1 ) ;
Hy( : , : , end ) = mur1( Hy_n_1_N_1_z , Hy_n_N_0_z , Hy_n_N_1_z , cte_mur1 ) ;
% -------------------------------------------------------------------------
% Boundary initial position H:
% -----------------------------
Hz( 1 , : , : ) = mur1( Hz_n_1_1 , Hz_n_0_0 , Hz_n_0_1 , cte_mur1 ) ;
Hx( 1 , : , : ) = mur1( Hx_n_1_1 , Hx_n_0_0 , Hx_n_0_1 , cte_mur1 ) ;
Hy( 1 , : , : ) = mur1( Hy_n_1_1 , Hy_n_0_0 , Hy_n_0_1 , cte_mur1 ) ;

Hz( : , 1 , : ) = mur1( Hz_n_1_1_y , Hz_n_0_0_y , Hz_n_0_1_y , cte_mur1 ) ;
Hx( : , 1 , : ) = mur1( Hx_n_1_1_y , Hx_n_0_0_y , Hx_n_0_1_y , cte_mur1 ) ;
Hy( : , 1 , : ) = mur1( Hy_n_1_1_y , Hy_n_0_0_y , Hy_n_0_1_y , cte_mur1 ) ;

Hz( : , : , 1 ) = mur1( Hz_n_1_1_z , Hz_n_0_0_z , Hz_n_0_1_z , cte_mur1 ) ;
Hx( : , : , 1 ) = mur1( Hx_n_1_1_z , Hx_n_0_0_z , Hx_n_0_1_z , cte_mur1 ) ;
Hy( : , : , 1 ) = mur1( Hy_n_1_1_z , Hy_n_0_0_z , Hy_n_0_1_z , cte_mur1 ) ;
% -------------------------------------------------------------------------