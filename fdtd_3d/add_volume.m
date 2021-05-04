function [V] = add_volume ( V, Vin , Vpos , nVin , gra)

% V    : Volumen total
% Vin  : Volumen a agregar
% Vpos : Volume Position
% nVin : Refraction Index of new volume
% gra  : Option to graph one slice
% -------------------------------
xS2 = Vpos(1) ;
yS2 = Vpos(2) ;
zS2 = Vpos(3) ;

sizeS2 = size(Vin) ;

% Set the index with respect the main volume
xIndex = floor( xS2 - sizeS2(1)/2 ) : floor( xS2 + sizeS2(1)/2 )-1;
yIndex = floor( yS2 - sizeS2(2)/2 ) : floor( yS2 + sizeS2(2)/2 )-1;
zIndex = floor( zS2 - sizeS2(3)/2 ) : floor( zS2 + sizeS2(3)/2 )-1;

% V(xIndex , yIndex , zIndex ) = Vin ;
V(xIndex , yIndex , zIndex ) = V(xIndex , yIndex , zIndex ).* (1-Vin)+...
                               nVin * Vin ;

% -------------------------------
if gra == 'y'    
    figure(1),
    % imagesc(sum(V,3))
    imagesc(reshape(V(50,:,:),[100 100]))
end
% -------------------------------

end