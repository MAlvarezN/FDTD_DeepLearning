function v = errorMean(A,B)
% B = reference data

for k = 1 : size(B,3) % loop bands
    v(k) = sum( sum( abs( A(:,:,k)-B(:,:,k) ) ) );
end
 
v = 100*v/numel(B) ; 