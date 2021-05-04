% -------------------------------------------------------------------------
function [ out , MAX , MIN ] = my_mat2gray( in )
% -------------------------------------------------------------------------
% Alternative to mat2gray function, for a 3D matrix.
% -------------------------------------------------------------------------
MAX = max( max( max( in ) ) ) ;
MIN = min( min( min( in ) ) ) ;

if ( MAX - MIN ) == 0
    out = in ;
else
    out =  1 /( MAX - MIN ) * ( in - MIN ) ;
end

end
% -------------------------------------------------------------------------
% (in *( MAX - MIN ) + MIN = out % Scale innverse