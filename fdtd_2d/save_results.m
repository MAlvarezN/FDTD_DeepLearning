% fdtd_time_loop
disp('    script-> fdtd_time_loop')
% 
% folder = '../..' ;
% name = strcat(['test10_Field_',num2str(time_step)]) ;
% save(name,'Ez')
% disp('Save... ok')

figure,
subplot(1,3,1)
imagesc(xcoor,ycoor,Ez.');
drawnow;
% axis equal;
axis xy;
colormap jet; colorbar;
title('Ez [V/m] (full range output)')

subplot(1,3,2)
imagesc(xcoor,ycoor,Ez.',[-1 1]);
drawnow; 
% axis equal;
axis xy;
colormap jet; colorbar;
title('Ez [V/m] (range output [-1 1])')

subplot(1,3,3)
imagesc(xcoor,ycoor,Ez.',[-.1 .1]);
drawnow; 
% axis equal; 
axis xy;
colormap jet; colorbar;
title('Ez [V/m] (range output [-.1 .1])')




