% -------------------------------------------------------------------------
%   Save boundaries of E: time n+1
% -------------------------------------------------------------------------

% -----------------------------------------------
% Ez:

% X direction
Ez_n_1_N_0   = Ez( end     , : ,: ) ; % := Ez_n_1( N , : ,: )
Ez_n_1_N_1   = Ez( end - 1 , : ,: ) ; % := Ez_n_1( N - 1 , : , : )

Ez_n_1_0     = Ez( 1 , : ,: ) ; % := Ez_n+1 ( 0 )
Ez_n_1_1     = Ez( 2 , : ,: ) ; % := Ez_n+1 ( 1 )

% Y direction
Ez_n_1_N_0_y = Ez( : , end     , : , : ) ; % := Ez_n_1( N , : ,: )
Ez_n_1_N_1_y = Ez( : , end - 1 , : , : ) ; % := Ez_n_1( N - 1 , : , : )

Ez_n_1_0_y   = Ez( : , 1 , : ,: ) ; % := Ez_n+1 ( 0 )
Ez_n_1_1_y   = Ez( : , 2 , : ,: ) ; % := Ez_n+1 ( 1 )

% Z direction
Ez_n_1_N_0_z = Ez( : , : , end     , : ,: ) ; % := Ez_n_1( N , : ,: )
Ez_n_1_N_1_z = Ez( : , : , end - 1 , : ,: ) ; % := Ez_n_1( N - 1 , : , : )

Ez_n_1_0_z   = Ez( : , : , 1 , : ,: ) ; % := Ez_n+1 ( 0 )
Ez_n_1_1_z   = Ez( : , : , 2 , : ,: ) ; % := Ez_n+1 ( 1 )

% -----------------------------------------------
% Ex:

% X direction
Ex_n_1_N_0   = Ex( end     , : ,: ) ; % := Ex_n_1( N , : ,: )
Ex_n_1_N_1   = Ex( end - 1 , : ,: ) ; % := Ex_n_1( N - 1 , : , : )

Ex_n_1_0     = Ex( 1 , : ,: ) ; % := Ex_n+1 ( 0 )
Ex_n_1_1     = Ex( 2 , : ,: ) ; % := Ex_n+1 ( 1 )

% Y direction
Ex_n_1_N_0_y = Ex( : , end     , : ,: ) ; % := Ex_n_1( N , : ,: )
Ex_n_1_N_1_y = Ex( : , end - 1 , : ,: ) ; % := Ex_n_1( N - 1 , : , : )

Ex_n_1_0_y   = Ex( : , 1 , : ,: ) ; % := Ex_n+1 ( 0 )
Ex_n_1_1_y   = Ex( : , 2 , : ,: ) ; % := Ex_n+1 ( 1 )

% Z direction
Ex_n_1_N_0_z = Ex( : , : , end     , : ,: ) ; % := Ex_n_1( N , : ,: )
Ex_n_1_N_1_z = Ex( : , : , end - 1 , : ,: ) ; % := Ex_n_1( N - 1 , : , : )

Ex_n_1_0_z   = Ex( : , : , 1 , : ,: ) ; % := Ex_n+1 ( 0 )
Ex_n_1_1_z   = Ex( : , : , 2 , : ,: ) ; % := Ex_n+1 ( 1 )

% -----------------------------------------------
% Ey:

% X direction
Ey_n_1_N_0   = Ey( end     , : ,: ) ; % := Ey_n_1( N , : ,: )
Ey_n_1_N_1   = Ey( end - 1 , : ,: ) ; % := Ey_n_1( N - 1 , : , : )

Ey_n_1_0     = Ey( 1 , : ,: ) ; % := Ey_n+1 ( 0 )
Ey_n_1_1     = Ey( 2 , : ,: ) ; % := Ey_n+1 ( 1 )

% Y direction
Ey_n_1_N_0_y = Ey( : , end     , : ,: ) ; % := Ey_n_1( N , : ,: )
Ey_n_1_N_1_y = Ey( : , end - 1 , : ,: ) ; % := Ey_n_1( N - 1 , : , : )

Ey_n_1_0_y   = Ey( : , 1 , : ,: ) ; % := Ey_n+1 ( 0 )
Ey_n_1_1_y   = Ey( : , 2 , : ,: ) ; % := Ey_n+1 ( 1 )

% Z direction
Ey_n_1_N_0_z = Ey( : , : , end     , : ,: ) ; % := Ey_n_1( N , : ,: )
Ey_n_1_N_1_z = Ey( : , : , end - 1 , : ,: ) ; % := Ey_n_1( N - 1 , : , : )

Ey_n_1_0_z   = Ey( : , : , 1 , : ,: ) ; % := Ey_n+1 ( 0 )
Ey_n_1_1_z   = Ey( : , : , 2 , : ,: ) ; % := Ey_n+1 ( 1 )

% -------------------------------------------------------------------------