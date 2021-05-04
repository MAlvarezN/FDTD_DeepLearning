function [time,net,tr] = CNN_PML( input , target , opt )
% -------------------------------------------------------------------------
%{
              This is an ANN to learn PML

                Alvarez, M.  -  michael.alvarez2@upr.edu
                Theran, C.   -  carlos.theran@upr.edu


%}
% -------------------------------------------------------------------------

%%

if nargin < 3
    
 opt.trainFcn = 'trainscg';
 opt.Iteration = 1000;
    
end

% input = mat2gray(input) ;
% target = mat2gray(target) ;
% 
mn = size(input) ;
for i=1:mn(3)
%     X_Train{i} = input(:,:,i);
%     Y_Train(1,1,:,i) = reshape(target(:,:,i),1,45);
    Y_T2(:,i) = reshape(target(:,:,i),1,45);
end  
% 
% % random by blocks
% 
% for i=1:mn(3)
%     X_Train{i} = X_Train{i}';
%     Y_Train{i} = Y_Train{i}';
% end  


X_Train(:,:,1,:) = input;
% Y_Train(:,:,1,:) = target;


miniBatchSize = 128 ;

% % % OPT 1
% layers = [ ...
%     imageInputLayer([15 12 1])
%     convolution2dLayer(3,500)
%     maxPooling2dLayer(2,'Stride',2)
%     convolution2dLayer(3,100)
%     fullyConnectedLayer(200)
%     fullyConnectedLayer(84)
%     fullyConnectedLayer(45)
%     regressionLayer]; % softmaxLayer

% % % OPT 2
layers = [ ...
    imageInputLayer([15 12 1])
    
convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    averagePooling2dLayer(2,'Stride',2)

    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    averagePooling2dLayer(2,'Stride',2)
  
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer  
    
    fullyConnectedLayer(45)
    regressionLayer];
    
    
options = trainingOptions('sgdm', ...
    'MiniBatchSize',miniBatchSize, ...
    'MaxEpochs',300, ...
    'InitialLearnRate',1e-3, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropFactor',0.1, ...
    'LearnRateDropPeriod',20, ...
    'Shuffle','every-epoch', ...
    'Plots','training-progress', ...
    'Verbose',false);

% 'ValidationData',{XValidation,YValidation}, ...
%     'ValidationFrequency',validationFrequency, ...
    
tic;
net  = trainNetwork(X_Train,Y_Train,layers,options);
time = toc ;
% net = trainNetwork(matrix_train,train_classes_label,layers,options);
% YPred = classify(net,matrix_test);
% accuracy = sum(YPred == test_classes_label)/numel(test_classes_label) ;

%  [errP , minV , maxV ] = ...
%          overall_error_net( net , X_Train , Y_Train )

end