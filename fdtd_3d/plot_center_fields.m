% -------------------------------------------------------------------------
% Plot center fields
% -------------------------------------------------------------------------
f = 3 ;
c = 3 ;
% -----------------------------------------------
% Ex
% -----------------------------------------------
figure(2);
subplot(f,c,1)
imagesc( Ex( : , : , end / 2 ) ); 
                title('Ex( : , : , end / 2 )');
                drawnow
subplot(f,c,2)
temp = Ex( : , end / 2 , : ) ;
imagesc( reshape( temp , [size(temp,1),size(temp,3) ] )  ); 
                title('Ex( : , end / 2 , : )');
                drawnow
subplot(f,c,3)
temp = Ex( end / 2 , : , : ) ;
imagesc( reshape( temp , [size(temp,2),size(temp,3) ] ) ); 
                title('Ex( end / 2 , : , : )');
                drawnow
% -----------------------------------------------
% Ey
% -----------------------------------------------                
subplot(f,c,4)
imagesc( Ey( : , : , end / 2 ) ); 
                title('Ey( : , : , end / 2 )');
                drawnow
subplot(f,c,5)
temp = Ey( : , end / 2 , : ) ;
imagesc( reshape( temp , [size(temp,1),size(temp,3) ] )  ); 
                title('Ey( : , end / 2 , : )');
                drawnow
subplot(f,c,6)
temp = Ey( end / 2 , : , : ) ;
imagesc( reshape( temp , [size(temp,2),size(temp,3) ] ) ); 
                title('Ey( end / 2 , : , : )');
                drawnow
% -----------------------------------------------
% Ez
% -----------------------------------------------                
subplot(f,c,7)
imagesc( Ez( : , : , end / 2 ) ); 
                title('Ez( : , : , end / 2 )');
                drawnow
subplot(f,c,8)
temp = Ez( : , end / 2 , : ) ;
imagesc( reshape( temp , [size(temp,1),size(temp,3) ] )  ); 
                title('Ez( : , end / 2 , : )');
                drawnow
subplot(f,c,9)
temp = Ez( end / 2 , : , : ) ;
imagesc( reshape( temp , [size(temp,2),size(temp,2) ] ) ); 
                title('Ez( end / 2 , : , : )');
                drawnow
                
% -------------------------------------------------------------------------                