% -------------------------------------------------------------------------
% Mur first Order
% -------------------------------------------------------------------------

% Mur First Order constant
cte_mur1     = ( c0 * domain.dt - domain.dx ) /...
              ( c0 * domain.dt + domain.dx ) ;

% -------------------------------------------------------------------------
% Boundary final position Ez:
% -----------------------------
% Ez_n_1_N_0 := Ez_n+1( N     , : ,: ) : Out
% Ez_n_1_N_1 := Ez_n+1( N - 1 , : ,: ) : A
% Ez_n_N_0   := Ez_n  ( N     , : ,: ) : B
% Ez_n_N_1   := Ez_n  ( N - 1 , : ,: ) : C

Ez( end , : , : ) = mur1( Ez_n_1_N_1 , Ez_n_N_0 , Ez_n_N_1 , cte_mur1 ) ;
Ex( end , : , : ) = mur1( Ex_n_1_N_1 , Ex_n_N_0 , Ex_n_N_1 , cte_mur1 ) ;
Ey( end , : , : ) = mur1( Ey_n_1_N_1 , Ey_n_N_0 , Ey_n_N_1 , cte_mur1 ) ;

Ez( : , end , : ) = mur1( Ez_n_1_N_1_y , Ez_n_N_0_y , Ez_n_N_1_y , cte_mur1 ) ;
Ex( : , end , : ) = mur1( Ex_n_1_N_1_y , Ex_n_N_0_y , Ex_n_N_1_y , cte_mur1 ) ;
Ey( : , end , : ) = mur1( Ey_n_1_N_1_y , Ey_n_N_0_y , Ey_n_N_1_y , cte_mur1 ) ;

Ez( : , : , end ) = mur1( Ez_n_1_N_1_z , Ez_n_N_0_z , Ez_n_N_1_z , cte_mur1 ) ;
Ex( : , : , end ) = mur1( Ex_n_1_N_1_z , Ex_n_N_0_z , Ex_n_N_1_z , cte_mur1 ) ;
Ey( : , : , end ) = mur1( Ey_n_1_N_1_z , Ey_n_N_0_z , Ey_n_N_1_z , cte_mur1 ) ;

% -------------------------------------------------------------------------
% Boundary initial position Ez:
% -----------------------------
% Ez_n_1_0 := Ez_n+1( 0 ) : Out
% Ez_n_1_1 := Ez_n+1( 1 ) : A
% Ez_n_0_0 := Ez_n  ( 0 ) : B
% Ez_n_0_1 := Ez_n  ( 1 ) : C

Ez( 1 , : , : ) = mur1( Ez_n_1_1 , Ez_n_0_0 , Ez_n_0_1 , cte_mur1 ) ;
Ex( 1 , : , : ) = mur1( Ex_n_1_1 , Ex_n_0_0 , Ex_n_0_1 , cte_mur1 ) ;
Ey( 1 , : , : ) = mur1( Ey_n_1_1 , Ey_n_0_0 , Ey_n_0_1 , cte_mur1 ) ;

Ez( : , 1 , : ) = mur1( Ez_n_1_1_y , Ez_n_0_0_y , Ez_n_0_1_y , cte_mur1 ) ;
Ex( : , 1 , : ) = mur1( Ex_n_1_1_y , Ex_n_0_0_y , Ex_n_0_1_y , cte_mur1 ) ;
Ey( : , 1 , : ) = mur1( Ey_n_1_1_y , Ey_n_0_0_y , Ey_n_0_1_y , cte_mur1 ) ;

Ez( : , : , 1 ) = mur1( Ez_n_1_1_z , Ez_n_0_0_z , Ez_n_0_1_z , cte_mur1 ) ;
Ex( : , : , 1 ) = mur1( Ex_n_1_1_z , Ex_n_0_0_z , Ex_n_0_1_z , cte_mur1 ) ;
Ey( : , : , 1 ) = mur1( Ey_n_1_1_z , Ey_n_0_0_z , Ey_n_0_1_z , cte_mur1 ) ;

% -------------------------------------------------------------------------