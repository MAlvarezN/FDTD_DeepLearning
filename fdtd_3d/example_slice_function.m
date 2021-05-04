clear
close all
[X,Y,Z] = meshgrid(-2:.2:2);
V = X.*exp(-X.^2-Y.^2-Z.^2);

xslice = [-1.2,0.8,2];   
yslice = [];
zslice = 0;
slice(X,Y,Z,V,xslice,yslice,zslice)
slice(V,xslice,yslice,zslice)
slice(V,1,10,5)

% for in slices
xslice0 = [-2:.2:2] 
for k = 1 : length(xslice0)
    
    xslice = xslice0( k ) ;
    yslice = xslice ;
    zslice = xslice ;
    slice(X,Y,Z,V,xslice,yslice,zslice)
	drawnow 
end
