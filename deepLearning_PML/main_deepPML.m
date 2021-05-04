%{
% -------------------------------------------------------------------------
%                       
%       ------------------------------------------------ 
%       This main is to train networks with differents
%        options for data input/target and net
%       ------------------------------------------------
%           
%             Alvarez, M.  -  michael.alvarez2@upr.edu
%             Theran, C.   -  carlos.theran@upr.edu
%       ------------------------------------------------
% 
%       Department of Electrical and Computer Engineering
%               University of Puerto Rico at Mayagez
%                   Mayaguez, Puerto Rico 00682
%  
% -------------------------------------------------------------------------
%} 

close all force ;
clear ;
clc ;

% -------------------------------------------------------------------------
%                   Data to train
% -------------------------------------------------------------------------
disp('1. Load Input Data'); 

% common folder
% fld = 'C:\Users\Michael\GDrive\UPRM\PhD\FDTD-Matlab\fdtd_2d\';
fld = 'E:\GDrive\UPRM\PhD\FDTD-Matlab\fdtd_2d\';


dataOpt = 2 ;

switch dataOpt
    case 0
        folder = strcat(fld,'2020_LSTM_PLN\oneCell_xn\');
        load([folder,'input.mat'])
        load([folder,'target.mat'])

    case 1
        folder =  strcat(fld,'2020_LSTM_PLN\2020_04_01\');
        load([folder,'input.mat'])
        load([folder,'target.mat'])

    case 2        
        namefile = strcat(fld,'trainData_yp_40cell') ;
        
        load(namefile)
        
        disp(data.name)
        disp(data.desc)
        input  = data.input ;
        target = data.target ;
        
    case 3  % data noralize with impedance of free space
        namefile = strcat(fld,'trainData_xp_E_norm_40cell');
        
        load(namefile)
        
        disp(data.name)
        disp(data.desc)
        input  = data.input ;
        target = data.target ;
        
    case 4  % data noralize with impedance of free space
            % data augmented
        disp(' -> Data augmented')
        
        namefile = strcat(fld,'trainData_xp_E_norm_40cell');
        
        load(namefile)
        
        disp(data.name)
        disp(data.desc)
        input  = data.input ;
        target = data.target ;
        
        data_augmentation
    
        
end
% -------------------------------------------------------------------------
%                   Network parameters
% -------------------------------------------------------------------------
disp('2. Default parameters')
parameterNet.inputSize      = 12 ;
parameterNet.numHiddenUnits = 20 ;
parameterNet.numResponses   = 3 ;
parameterNet.seqLength      = 'longest';%'shortest' ;

% CNN parameters

% -------------------------------------------------------------------------
%                   Choose deep neural network option
% -------------------------------------------------------------------------
disp('3. Choose deep network')
deepChose = 6 ;

switch deepChose
    
    case 1
        [time,net] = LSTM_PML(input,target) ;
        
    case 2
        [time,net] = LSTM_PML2(input,target) ;
        
    case 3
        [time,net] = BiLSTM_PML(input,target) ;
    case 4
        [time,net] = BiLSTM_PML_p(input,target,parameterNet) ;
    case 5
        [time,net] = ANN_PML(input,target);
        
    case 6
        [time,net] = CNN_PML(input,target);
end




% -------------------------------------------------------------------------
%       Save simulation data
% -------------------------------------------------------------------------
disp('4. Save simulation data')
netData.net          = net ;
netData.time         = time ;
netData.dataOpt      = dataOpt ;
netData.deepChose    = deepChose ;
netData.parameterNet = parameterNet ;

return % guardar manualmente, falt validar nombres
name = strcat(['net_',num2str(deepChose),...
               '_data_',num2str(dataOpt),...
               '_id_03']) ;
save(name,'netData')

% END
% -------------------------------------------------------------------------
