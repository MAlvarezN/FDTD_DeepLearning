% -------------------------------------------------------------------------
function C = times3d( A , B )
% -------------------------------------------------------------------------
% 3d matrix times
% 
C = zeros( size( A ) ) ;
for k  = 1 : size(A,3)
    C( : , : , k ) = A( : , : , k ) .* B( : , : , k ) ;
end


end
% -------------------------------------------------------------------------
