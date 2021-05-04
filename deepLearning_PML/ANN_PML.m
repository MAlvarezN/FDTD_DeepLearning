function [time,net,tr] = ANN_PML( input , target , opt )
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

mn = size(input) ;
for i=1:mn(3)
    X_Train{i} = input(:,:,i);
    Y_Train{i} = target(:,:,i);
end  

% random by blocks

for i=1:mn(3)
    X_Train{i} = X_Train{i}';
    Y_Train{i} = Y_Train{i}';
end  

idx=floor(mn(2)*0.90);   %compute the 80% of element in X_Train

X_Validation=X_Train(idx+1:end);  %take the last 20% of trainig elemets for validation
%X_Train(idx+1:end)=[];
Size_train = idx;
Size_test= mn(2)-idx;

Y_Validation=Y_Train(idx+1:end);  %take the last 20% of trainig elemets for validation
%Y_Train(idx+1:end)=[];

%%                                Model Neural Netwok and Classification
 %%Solvers 'trainscg', 'traingd'  

 trainFcn = opt.trainFcn ;
 Iteration = opt.Iteration;
 %para configurar nodos y hidden layer setup=[2 5 10] tres hidden layers con el 
 %primero 2 nodos segundo 5 nodos tercero 10 nodos
 setup=[3 3 3];
%  net = patternnet(setup, trainFcn);  
 net = fitnet(setup) ;
 net.trainParam.epochs = Iteration;
 
 % Choose Input and Output Pre/Post-Processing Functions
 %net.input.processFcns = {'removeconstantrows','mapminmax'};
 %net.output.processFcns = {'removeconstantrows','mapminmax'};
 
 % Setup Division of Data for Training, Validation, Testing
 net.divideFcn = 'divideind';  % Divide data by given index
 net.divideMode = 'sample';    % Divide up every sample
 
 % Dividing Data
 net.divideParam.trainInd = 1:Size_train;
 net.divideParam.valInd = [];
 net.divideParam.testInd = (Size_train+1):(Size_train+Size_test);
 
 % Choose a Performance Function
 % For a list of all performance functions type: help nnperformance
 net.performFcn = 'sse';  % It measures performance according 
                          %  to the sum of squared errors 
 
 % Choose Plot Functions
 % For a list of all plot functions type: help nnplot
 %net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
 %   'plotconfusion', 'plotroc'};
 
  
%% Train the Network
tic;
[net,tr] = train(net,X_Train,Y_Train);
time = toc;
disp(['Time total = ',num2str(time)])

% check overall error in training

 % [errP , minV , maxV ] = ...
%          overall_error_net( net , X_Train , Y_Train )
end

%{
% ============ old code ==========

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for i=1:length(classes)
%      classes(i).label = cellstr(classes(i).label);
% end
% % loading size of colum from train_pixels (Training,Testing)
%  
% [~,N_clases] = size(classes);
% [N_Bandas,~] = size(Image);
%  for i = 1:N_clases
%      [~, Train_Colum(i)]=size(classes(i).train_pixels');
%      [~, Test_Colum(i)]=size(classes(i).test_pixels'); 
%  end
% 
%  Size_train=0;
%  Size_test=0;
%  for i=1:N_clases
%      Size_train=Train_Colum(i)+Size_train;
%      Size_test=Test_Colum(i)+Size_test;
%  end 
%     
%     
%  %%                                  creating Label for classes training
% train_clases_label = [];
% for i=1:N_clases
%     train_clases_label =vertcat(train_clases_label,repmat(i,Train_Colum(i), 1));
% end    
%   
% %%                                  creating Label for classes testing
%  test_clases_label = [];
% for i=1:N_clases
%     test_clases_label =vertcat(test_clases_label,repmat(i,Test_Colum(i), 1));
% end 
% 
%  %%                                       building matrix training and testing
% 
% for i=1:N_clases
%     for j=1:N_Bandas
%       Matrix_train{i}(j,:)=Image(j,classes(i).train_pixels);
%     end
%     %celldisp(Matrix_train)
% end  
% 
% for i=1:N_clases
%     for j=1:N_Bandas
%       Matrix_test{i}(j,:)=Image(j,classes(i).test_pixels);
%     end
% end 
% 
% train_clases = [];
% test_clases = [];
% for i=1:N_clases  
%      train_clases = vertcat(train_clases,Matrix_train{i}');
%      test_clases = vertcat(test_clases,Matrix_test{i}');
% end 
% 
% %Note: the vectors train_clases and test_clases contein the position at the
% %pixel in row format matrix (1xn). So we must transform into (pxd). i=  
% 
%  %Image=Image.Image';
%  
% 
% X=[train_clases;test_clases];
% pixels_Labels = [train_clases_label;test_clases_label];
% Image = Image';
%%
for i=1:size(input,3)
    X_Train{i} = input(:,:,i);
    Y_Train{i} = target(:,:,i);
end  

% random by blocks

for i=1:size(input,3)
    X_Train{i} = X_Train{i}';
    Y_Train{i} = Y_Train{i}';
end  

idx=floor(size(X_Train,2)*0.90);   %compute the 80% of element in X_Train

X_Validation=X_Train(idx+1:end);  %take the last 20% of trainig elemets for validation
%X_Train(idx+1:end)=[];
Size_train = idx;
Size_test= size(X_Train,2)-idx;

Y_Validation=Y_Train(idx+1:end);  %take the last 20% of trainig elemets for validation
%Y_Train(idx+1:end)=[];


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                Model Neural Netwok and Classification
 %%Solvers 'trainscg', 'traingd'  

 trainFcn = 'trainscg';
 Iteration = 1000;
 %para configurar nodos y hidden layer setup=[2 5 10] tres hidden layers con el 
 %primero 2 nodos segundo 5 nodos tercero 10 nodos
 setup=[3 3 3];
%  net = patternnet(setup, trainFcn);  
 net = fitnet(setup) ;
 net.trainParam.epochs=Iteration;
 
 % Choose Input and Output Pre/Post-Processing Functions
 %net.input.processFcns = {'removeconstantrows','mapminmax'};
 %net.output.processFcns = {'removeconstantrows','mapminmax'};
 
 % Setup Division of Data for Training, Validation, Testing
 net.divideFcn ='divideind';  % Divide data by given index
 net.divideMode ='sample';  % Divide up every sample
 
 % Dividing Data
 net.divideParam.trainInd = 1:Size_train;
 net.divideParam.valInd = [];
 net.divideParam.testInd = (Size_train+1):(Size_train+Size_test);
 
 % Choose a Performance Function
 % For a list of all performance functions type: help nnperformance
 net.performFcn = 'sse';  % It measures performance according to the sum of squared errors 
 
 % Choose Plot Functions
 % For a list of all plot functions type: help nnplot
 %net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
 %   'plotconfusion', 'plotroc'};
 
  % Train the Network
  [net,tr] = train(net,X_Train,Y_Train);
 
% %  %Test the Network
% %  clasifisv_vec = net(X');
% %  
% %  clasifisv_image = net(Image');
% %  
% %  %keyboard
% %  clasifisv=vec2ind(clasifisv_vec);
% %  %clasifisv_image=vec2ind(clasifisv_image);
% %  %clasifisv=clasifisv';
% %  %[~, clasifigsv]   =   max(clasifisv_vec');
% %  clasifisv_image = clasifisv_image';
% %  clasifitrain=clasifisv(1:(Size_train));
% %  clasifitest=clasifisv(Size_train+1:end);
% 
end
               


%}
