function [time,net]=BiLSTM_PML_p(input,target,opt)

if nargin < 3
    inputSize      = 12 ;
    numHiddenUnits = 20 ;
    numResponses   = 3 ;
    seqLength      = 1 ;
else
    inputSize      = opt.inputSize ;
    numHiddenUnits = opt.numHiddenUnits ;
    numResponses   = opt.numResponses ;
    seqLength      = opt.seqLength ;
end

for i=1:size(input,3)
    X_Train{i} = input(:,:,i);
    Y_Train{i} = target(:,:,i);
end  

irand = randperm(size(input,3));
for i=1:size(input,3)
    X_Train{i} = X_Train{irand(i)}';
    Y_Train{i} = Y_Train{irand(i)}';
end  
% for i=1:size(input,3)
%     X_Train{i} = X_Train{i}';
%     Y_Train{i} = Y_Train{i}';
% end  

idx=size(X_Train,2)*0.90;   %compute the 80% of element in X_Train

X_Validation=X_Train(idx+1:end);  %take the last 20% of trainig elemets for validation
X_Train(idx+1:end)=[];

Y_Validation=Y_Train(idx+1:end);  %take the last 20% of trainig elemets for validation
Y_Train(idx+1:end)=[];


%%

layers = [ ...
    sequenceInputLayer(inputSize)
%     lstmLayer(numHiddenUnits,'OutputMode','sequence')
%     fullyConnectedLayer(numResponses)
      bilstmLayer(numHiddenUnits,'OutputMode','sequence')
%     fullyConnectedLayer(numResponses)
%       lstmLayer(numHiddenUnits,'OutputMode','sequence')
    fullyConnectedLayer(numResponses)
%                 maxPooling2dLayer(2,'Stride',2) % podria fallar        
    regressionLayer];

%%                                  

miniBatchSize = 7;
%
%     'ValidationData',{X_Validation,Y_Validation}, ...
%     'ValidationFrequency',30, ...
maxEpochs = 10 ; % This parameter can generate overfitting
       
    options = trainingOptions('adam', ...
    'MaxEpochs',maxEpochs, ...
    'Verbose',0, ...
    'MiniBatchSize',miniBatchSize, ...
    'ValidationData',{X_Validation,Y_Validation}, ...
    'ValidationFrequency',30, ...
    'GradientThreshold',0.1, ...
    'GradientThresholdMethod','global-l2norm', ...
    'InitialLearnRate',0.001,...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropPeriod',maxEpochs/2,...
    'LearnRateDropFactor',0.1,...
    'SequenceLength', seqLength, ...
    'Plots','training-progress');

%%
tic;
    net = trainNetwork(X_Train,Y_Train,layers,options);
time = toc;
disp(['Time total = ',num2str(time)])

%% Simple test
y1 = target(end,:,40) ;
y2 = (predict(net,reshape(input(end,:,40),12,1)))'  ;
disp(['Target : ',num2str(y1)])
disp(['Predict: ',num2str(y2)])
disp(['Error  : ',num2str(norm(y2-y1))])
%%   Simple test
y1 = target(end,:,40) ;
y2 = (predict(net,reshape(input(end,:,40),12,1)))'  ;
disp(['Target : ',num2str(y1)])
disp(['Predict: ',num2str(y2)])
disp(['Error  : ',num2str(norm(y2-y1))])
 

  
end
               
