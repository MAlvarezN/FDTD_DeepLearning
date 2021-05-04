
% test add volume

S1 = my_sphere( 10 ) ;

S2 = my_sphere( 20 ) ;

S3 = my_sphere( 30 ) ;

whos S1 S2 S3



% crear un medio con los elementos anteriores:

sizeS1 = size(S1) ;

sizeS2 = size(S2) ;

sizeS3 = size(S3) ;



xmax = max([ sizeS1(1) , ...
             sizeS2(1) , ...
             sizeS3(1)] )


ymax = max([ sizeS1(2) , ...
             sizeS2(2) , ...
             sizeS3(2)] )         

zmax = max([ sizeS1(3) , ...
             sizeS2(3) , ...
             sizeS3(3)] )
         
% New matrix (minimum volume for complete objet):
M = zeros( xmax , ymax , zmax ) ;

% Primer objecto con respecto al centro
xS1 = 20 ;
yS1 = 20 ;
zS1 = 30 ;

% Set the index with respect the main volume
xIndex = floor( xS1 - sizeS1(1)/2 ) : floor( xS1 + sizeS1(1)/2 )-1;
yIndex = floor( yS1 - sizeS1(2)/2 ) : floor( yS1 + sizeS1(1)/2 )-1;
zIndex = floor( zS1 - sizeS1(3)/2 ) : floor( zS1 + sizeS1(1)/2 )-1;

M(xIndex , yIndex , zIndex ) = S1 ;
         
 
         
% Segundo objecto con respecto al centro
xS2 = 50 ;
yS2 = 50 ;
zS2 = 52 ;

% Set the index with respect the main volume
xIndex = floor( xS2 - sizeS2(1)/2 ) : floor( xS2 + sizeS2(1)/2 )-1;
yIndex = floor( yS2 - sizeS2(2)/2 ) : floor( yS2 + sizeS2(2)/2 )-1;
zIndex = floor( zS2 - sizeS2(3)/2 ) : floor( zS2 + sizeS2(3)/2 )-1;

M(xIndex , yIndex , zIndex ) = S2 ;
                  
         
         
         
figure,
for k = 1 : size(M,3)    
    imagesc( M( : , : , k ) )
    drawnow
    pause(.1)
end         
         
         
