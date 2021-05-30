clc
clear
close all
restoredefaultpath

% fld_fdtd = 'E:\GoogleDrive\UPRM\PhD\FDTD-Matlab\fdtd_2d' ; % PC5
% % fld_fdtd = 'C:\Users\Michael\Desktop\CNN_interative' ; % Asus
% addpath(fld_fdtd+"\myEncoderDecoder")
%% Create the input and target

% Input == [Medium real(Hz vacuum) im(Hz vacuum)]
% Target == [ real(Hz Medium) im(Hz Medium)]
% load(fld_fdtd+"\data_GaussianWaves2\mediumHz")% mediumHz
% load(fld_fdtd+"\data_GaussianWaves2\Hz_vacuum") % Hz
load("mediumHz.mat")% mediumHz
load("Hz_vacuum.mat") % Hz
Hz_vacuum = Hz(11:end-10,11:end-10) ; % remove PML region
% load(fld_fdtd+"\data_waves\medium_Space.mat")%out1
load("medium_Space.mat")%out1

mnOut1 = size(out1) ; %

for contMedium = 1 : mnOut1(3) % ============================= loop medium
 Input(:,:,:,contMedium) = ...
         cat(3 , out1(:,:,contMedium) , ...
                 Hz_vacuum) ;
             
 Target(:,:,:,contMedium) = mediumHz(:,:,contMedium) ;             
end

%% Data train
XTrain = Input(:,:,:,1:90) ;
YTrain = Target(:,:,:,1:90) ;
figure,
for contM = 1:10
    
AA = XTrain(:,:,:,contM) ;
BB = YTrain(:,:,:,contM) ;

    subplot(221),
    imagesc(AA(:,:,1)), title('Medium')
    subplot(222),
    imagesc(AA(:,:,2)), title('Hz Vacuum')
    
    subplot(224),
    imagesc(BB(:,:,1)), title('Hz Medium')
    
    drawnow    
    colormap jet
    pause(.5)    
end

%% choose Unet-FDTD
chooseNet = 1 ;
switch chooseNet
    case 1
% create_EncoderDecoder
create_Unet_ResBlock_FullConection
    case 2
addpath('C:\Users\Michael\Desktop\SuperResolution_HS-Lidar\')
% % Unet_Lidar
Unet_Lidar_v2
    case 3
EncoderDecoder
lgraph = layers ;
end

% % options = trainingOptions('adam','MaxEpochs',10);
options = trainingOptions('adam', ...
    'MaxEpochs',500, ...
    'MiniBatchSize',16, ...
    'Shuffle','never', ...
    'Plots','training-progress', ...
    'Verbose',false);

net = trainNetwork(XTrain,YTrain,lgraph,options);

%% Data testing
XTest = Input(:,:,:,91:end) ;
YTest = Target(:,:,:,91:end) ;
YPred = predict(net,XTest);

% figure,
figure('units','normalized','outerposition',[0 0 1 1])
for contM = 1:10
%  figure,   
AA = YPred(:,:,:,contM) ;
BB = YTest(:,:,:,contM) ;

    subplot(121),
    imagesc(abs(AA')), axis xy, axis square, title('Hz Predict')
    
    subplot(122),
    imagesc(abs(BB')), axis xy, axis square, title('Hz FDTD')
    
    drawnow
    colormap jet
        
    name = ".\test\Ytest"+num2str(contM)+".png" ;
    saveas(gcf,name) 
    pause(1)
end
    

%% Compute some metrics
ys = 0 ;
ye = 0 ;
for contM = 1 :10
    
AA = double( YPred(:,:,:,contM) ) ;
BB = double( YTest(:,:,:,contM) ) ;

ys(contM) = ssim(AA,BB) ;
temp = errorMean(AA,BB) ;
ye(contM) = temp(1) ;

end

figure,
    subplot(121), 
    plot(ys,'-*b'), title('SSIM test samples')
%     ylim([0 1]),
    ylabel('SSIM')
    xlabel('test id')
    subplot(122),
    plot(ye,'-sr'), title('Mean Error')
%     ylim([0 1]),
    ylabel('% Mean Error')
    xlabel('test id')
    






% -------------------------------------------------------------------------
    