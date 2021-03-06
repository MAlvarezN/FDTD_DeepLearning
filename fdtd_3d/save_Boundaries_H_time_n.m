% -------------------------------------------------------------------------
%   Save boundaries of H: time n
% -------------------------------------------------------------------------

% -----------------------------------------------
% Hz:

% X direction
Hz_n_N_0 = Hz( end     , : ,: ) ; % := Hz_n( N , : ,: )
Hz_n_N_1 = Hz( end - 1 , : ,: ) ; % := Hz_n( N - 1 , : , : )

Hz_n_0_0 = Hz( 1 , : , : ) ; % := Hz_n  ( 0 )
Hz_n_0_1 = Hz( 2 , : , : ) ; % := Hz_n  ( 1 )

% Y direction
Hz_n_N_0_y = Hz( : , end     , : ) ; % := Hz_n( N , : ,: )
Hz_n_N_1_y = Hz( : , end - 1 , : ) ; % := Hz_n( N - 1 , : , : )

Hz_n_0_0_y = Hz( : , 1 , : ) ; % := Hz_n  ( 0 )
Hz_n_0_1_y = Hz( : , 2 , : ) ; % := Hz_n  ( 1 )

% Z direction
Hz_n_N_0_z = Hz( : , : , end     ) ; % := Hz_n( N , : ,: )
Hz_n_N_1_z = Hz( : , : , end - 1 ) ; % := Hz_n( N - 1 , : , : )

Hz_n_0_0_z = Hz( : , : , 1 ) ; % := Hz_n  ( 0 )
Hz_n_0_1_z = Hz( : , : , 2 ) ; % := Hz_n  ( 1 )

% -----------------------------------------------
% Hx:

% X direction
Hx_n_N_0 = Hx( end     , : ,: ) ; % := Hx_n( N , : ,: )
Hx_n_N_1 = Hx( end - 1 , : ,: ) ; % := Hx_n( N - 1 , : , : )

Hx_n_0_0 = Hx( 1 , : ,: ) ; % := Hx_n  ( 0 )
Hx_n_0_1 = Hx( 2 , : ,: ) ; % := Hx_n  ( 1 )

% Y direction
Hx_n_N_0_y = Hx( : , end     , : ) ; % := Hx_n( N , : ,: )
Hx_n_N_1_y = Hx( : , end - 1 , : ) ; % := Hx_n( N - 1 , : , : )

Hx_n_0_0_y = Hx( : , 1 , : ) ; % := Hx_n  ( 0 )
Hx_n_0_1_y = Hx( : , 2 , : ) ; % := Hx_n  ( 1 )

% Z direction
Hx_n_N_0_z = Hx( : , : , end     ) ; % := Hx_n( N , : ,: )
Hx_n_N_1_z = Hx( : , : , end - 1 ) ; % := Hx_n( N - 1 , : , : )

Hx_n_0_0_z = Hx( : , : , 1 ) ; % := Hx_n  ( 0 )
Hx_n_0_1_z = Hx( : , : , 2 ) ; % := Hx_n  ( 1 )

% -----------------------------------------------
% Hy:

% X direction
Hy_n_N_0 = Hy( end     , : ,: ) ; % := Hy_n( N , : ,: )
Hy_n_N_1 = Hy( end - 1 , : ,: ) ; % := Hy_n( N - 1 , : , : )

Hy_n_0_0 = Hy( 1 , : ,: ) ; % := Hy_n  ( 0 )
Hy_n_0_1 = Hy( 2 , : ,: ) ; % := Hy_n  ( 1 )

% Y direction
Hy_n_N_0_y = Hy( : , end     , : ) ; % := Hy_n( N , : ,: )
Hy_n_N_1_y = Hy( : , end - 1 , : ) ; % := Hy_n( N - 1 , : , : )

Hy_n_0_0_y = Hy( : , 1 , : ) ; % := Hy_n  ( 0 )
Hy_n_0_1_y = Hy( : , 2 , : ) ; % := Hy_n  ( 1 )

% Z direction
Hy_n_N_0_z = Hy( : , : ,  end     ) ; % := Hy_n( N , : ,: )
Hy_n_N_1_z = Hy( : , : ,  end - 1 ) ; % := Hy_n( N - 1 , : , : )

Hy_n_0_0_z = Hy( : , : ,  1 ) ; % := Hy_n  ( 0 )
Hy_n_0_1_z = Hy( : , : ,  2 ) ; % := Hy_n  ( 1 )

% -------------------------------------------------------------------------