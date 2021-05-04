% -------------------------------------------------------------------------
function C = difpos3d( A , dir )
% -------------------------------------------------------------------------
% 3d substraction indicate the direction
% 
C = zeros( size( A ) ) ;
switch dir
    case 'i' % ---------------
        
    for i = 1 : size(A,1) - 1
        C( i , 2:end-1 , 2:end-1 ) = A( i + 1 , 2:end-1 , 2:end-1 ) - ...
                                     A( i     , 2:end-1 , 2:end-1 ) ;
    end

    case 'j' % ---------------
        
    for j = 1 : size(A,2) - 1
        C( 2:end-1 , j , 2:end-1 ) = A( 2:end-1 , j + 1 , 2:end-1 ) - ...
                                     A( 2:end-1 , j     , 2:end-1 ) ;
    end
    case 'k' % ---------------
        
    for k = 1 : size(A,3) - 1
        C( 2:end-1 , 2:end-1 , k ) = A( 2:end-1 , 2:end-1 , k + 1 ) - ...
                                     A( 2:end-1 , 2:end-1 , k     ) ;
    end
    
    otherwise % ---------------
        C = [] ;
        disp('Error!')
        return
end

end
% -------------------------------------------------------------------------
