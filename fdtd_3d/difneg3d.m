% -------------------------------------------------------------------------
function C = difneg3d( A , dir )
% -------------------------------------------------------------------------
% 3d substraction indicate the direction
% 
C = zeros( size( A ) ) ;
switch dir
    case 'i' % ---------------
        
    for i = 2 : size(A,1)
        C( i , 2:end-1 , 2:end-1 ) = A( i     , 2:end-1 , 2:end-1 ) - ...
                                     A( i - 1 , 2:end-1 , 2:end-1 ) ;
    end

    case 'j' % ---------------
        
    for j = 2 : size(A,2)
        C( 2:end-1 , j , 2:end-1 ) = A( 2:end-1 , j     , 2:end-1 ) - ...
                                     A( 2:end-1 , j - 1 , 2:end-1 ) ;
    end
    case 'k' % ---------------
        
    for k = 2 : size(A,3)
        C( 2:end-1 , 2:end-1 , k ) = A( 2:end-1 , 2:end-1 , k ) - ...
                                     A( 2:end-1 , 2:end-1 , k - 1 ) ;
    end
    
    otherwise % ---------------
        C = [] ;
        disp('Error!')
        return
end

end
% -------------------------------------------------------------------------
