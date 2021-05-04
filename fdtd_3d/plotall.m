% -------------------------------------------------------------------------
% Plot all boundaries
% -------------------------------------------------------------------------
f = 2 ;
c = 3 ;
% -----------------------------------------------
% Ex
% -----------------------------------------------
figure(1);
subplot(f,c,1)
imagesc( Ex( : , : , 1 ) ); 
                title('Ex( : , : , 1 )');
                drawnow
subplot(f,c,2)
imagesc( Ex( : , : , end ) ); 
                title('Ex( : , : , end )');
                drawnow
subplot(f,c,3)
temp = Ex( : , 1 , : ) ;
imagesc( reshape( temp , [size(temp,1),size(temp,3) ] ) ); 
                title('Ex( : , 1 , : )');
                drawnow
subplot(f,c,4)
temp = Ex( : , end , : ) ;
imagesc( reshape( temp , [size(temp,1),size(temp,3) ] ) ); 
                title('Ex( : , end , : )');
                drawnow
subplot(f,c,5)
temp = Ex( 1 , : , : ) ;
imagesc( reshape( temp , [size(temp,2),size(temp,3) ] ) ); 
                title('Ex( 1 , : , : )');
                drawnow
subplot(f,c,6)
temp = Ex( end , : , : ) ;
imagesc( reshape( temp , [size(temp,2),size(temp,3) ] ) ); 
                title('Ex( end , : , : )');
                drawnow                
% % -----------------------------------------------
% % Ey
% % -----------------------------------------------
% figure(2);
% subplot(f,c,1)
% imagesc( Ey( : , : , 1 ) ); 
%                 title('Ey( : , : , 1 )');
%                 drawnow
% subplot(f,c,2)
% imagesc( Ey( : , : , end ) ); 
%                 title('Ey( : , : , end )');
%                 drawnow
% subplot(f,c,3)
% temp = Ey( : , 1 , : ) ;
% imagesc( reshape( temp , [size(temp,1),size(temp,3) ] ) ); 
%                 title('Ey( : , 1 , : )');
%                 drawnow
% subplot(f,c,4)
% temp = Ey( : , end , : ) ;
% imagesc( reshape( temp , [size(temp,1),size(temp,3) ] ) ); 
%                 title('Ey( : , end , : )');
%                 drawnow
% subplot(f,c,5)
% temp = Ey( 1 , : , : ) ;
% imagesc( reshape( temp , [size(temp,2),size(temp,3) ] ) ); 
%                 title('Ey( 1 , : , : )');
%                 drawnow
% subplot(f,c,6)
% temp = Ey( end , : , : ) ;
% imagesc( reshape( temp , [size(temp,2),size(temp,3) ] ) ); 
%                 title('Ey( end , : , : )');   
% % -----------------------------------------------
% % Ez
% % -----------------------------------------------
% figure(3);
% subplot(f,c,1)
% imagesc( Ez( : , : , 1 ) ); 
%                 title('Ez( : , : , 1 )');
%                 drawnow
% subplot(f,c,2)
% imagesc( Ez( : , : , end ) ); 
%                 title('Ez( : , : , end )');
%                 drawnow
% subplot(f,c,3)
% temp = Ez( : , 1 , : ) ;
% imagesc( reshape( temp , [size(temp,1),size(temp,3) ] ) ); 
%                 title('Ez( : , 1 , : )');
%                 drawnow
% subplot(f,c,4)
% temp = Ez( : , end , : ) ;
% imagesc( reshape( temp , [size(temp,1),size(temp,3) ] ) ); 
%                 title('Ez( : , end , : )');
%                 drawnow
% subplot(f,c,5)
% temp = Ez( 1 , : , : ) ;
% imagesc( reshape( temp , [size(temp,2),size(temp,3) ] ) ); 
%                 title('Ez( 1 , : , : )');
%                 drawnow
% subplot(f,c,6)
% temp = Ez( end , : , : ) ;
% imagesc( reshape( temp , [size(temp,2),size(temp,3) ] ) ); 
%                 title('Ez( end , : , : )');
% % -------------------------------------------------------------------------                
%                 imagesc( Ex( : , : , end ) ); colorbar; drawnow
%             imagesc( Ex( : , : , end/2 ) ); colorbar; drawnow