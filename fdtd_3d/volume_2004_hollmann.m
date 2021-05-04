
% Volumen used in Fig 4 of 2004-Hollmann
% 2004 - Hollmann, Dunn, Dimarzio - Computational microscopy in embryo imaging

% 
% Required:

V = ones(100,100,100) * 1.33 ; % water (background)

S1 = my_sphere( 30 ) ; % Large Sphere n = 1.35

S2 = my_sphere( 10 ) ; % Small Sphere n = 1.37

% 
% Mixed:

[V] = add_volume ( V, S1 , [50 50 50] , 1.35 , 'n') ; % water + large s
[V] = add_volume ( V, S2 , [50 50 33] , 1.37 , 'n') ; % + s1
[V] = add_volume ( V, S2 , [50 65 60] , 1.37 , 'n') ; % + s2
[V] = add_volume ( V, S2 , [50 35 60] , 1.37 , 'y') ; % + s3
