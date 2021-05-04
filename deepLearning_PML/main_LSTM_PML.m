%{
% -------------------------------------------------------------------------
% 
%       ------------------------------------------------ 
%                     LSTM_PML
%       ------------------------------------------------
%           
%             Alvarez, M.  -  michael.alvarez2@upr.edu
%             Theran, C.   -  carlos.theran@upr.edu
% 
%       ------------------------------------------------
% 
%       Department of Electrical and Computer Engineering
%               University of Puerto Rico at Mayagez
%                   Mayaguez, Puerto Rico 00682
%  
% -------------------------------------------------------------------------
%} 

close all;
clear;
clc;

restoredefaultpath
% path(path,'Z:\Data Fusion\code_myfunctions\')
% path(path, 'Z:\Data Fusion\LSTM_SRP\');
% addpath 'C:\Users\Michael\GDrive\UPRM\PhD\FDTD-Matlab\fdtd_2d\LSTM_PML'
% -----------------------------------------------
%                   Input
% -----------------------------------------------
disp('Load Input Data'); 
% folder = 'C:\Users\Michael\GDrive\UPRM\PhD\FDTD-Matlab\fdtd_2d\2020_LSTM_PLN\oneCell_xn\';
folder = 'C:\Users\Michael\GDrive\UPRM\PhD\FDTD-Matlab\fdtd_2d\2020_LSTM_PLN\2020_04_01\';
load([folder,'input.mat'])
load([folder,'target.mat'])

normFields = 0 ;
if normFields == 0
%     [time,net] = LSTM_PML(input,target)
    [time,net] = BiLSTM_PML(input,target)
%     [time,net] = LSTM_PML2(input,target) % change format cube
    return
end
% load('C:\Users\michael.alvarez2\Downloads\GDrive\UPRM\PhD\FDTD-Matlab\fdtd_2d\2020_LSTM_PLN\input.mat')
% load('C:\Users\michael.alvarez2\Downloads\GDrive\UPRM\PhD\FDTD-Matlab\fdtd_2d\2020_LSTM_PLN\target.mat')

% input : Xij(cont,:) = [Hz(i,j), Hz(i,j+1), Hz(i,j-1), Hz(i+1,j), ...
%                        Ex(i,j), Ex(i,j+1), Ex(i,j-1), Ex(i+1,j), ...
%                        Ey(i,j), Ey(i,j+1), Ey(i,j-1), Ey(i+1,j) ] ;

% -------------------------------------------------------------------------
disp(' Separate the vector of input')

mn = size(input) ; %  64    12   299
inHz = zeros(1,4*mn(1)*mn(3)) ;
inEx = zeros(1,4*mn(1)*mn(3)) ;
inEy = zeros(1,4*mn(1)*mn(3)) ;
for band = 1 :mn(3)
    for k = 1 : mn(1) % rows
        indexHz = 1 + 4*(k-1) : 4*k ;
        indexHz = indexHz + (band -1)*4*mn(1);
        inHz( indexHz ) = input(k,1:4 ,band) ; % [Hz(i,j), Hz(i,j+1), Hz(i,j-1), Hz(i+1,j), ...
        inEx( indexHz ) = input(k,5:8 ,band) ; % Ex(i,j), Ex(i,j+1), Ex(i,j-1), Ex(i+1,j), ...
        inEy( indexHz ) = input(k,9:12,band) ; % Ey(i,j), Ey(i,j+1), Ey(i,j-1), Ey(i+1,j) ] ;
    end
end

% -------------------------------------------------------------------------
disp(' Scale partition uniform of size S')
mn_inHz = size(inHz) ;
S = 4 ;
index = 1 : S : mn_inHz(2) + S ;
for i = 1 : length(index)-1
[min(index(i) : index(i+1) - 1) max(index(i) : index(i+1) - 1)]
    % Hz
tmp = inHz( index(i) : index(i+1) - 1 ) ;
[ out , MAX , MIN ] = my_mat2gray( tmp ) ;
inHz( index(i) : index(i+1) - 1 ) = out ;

    % Ex
tmp = inEx( index(i) : index(i+1) - 1 ) ;
[ out , MAX , MIN ] = my_mat2gray( tmp ) ;
inEx( index(i) : index(i+1) - 1 ) = out ;

    % Ey
tmp = inEy( index(i) : index(i+1) - 1 ) ;
[ out , MAX , MIN ] = my_mat2gray( tmp ) ;
inEy( index(i) : index(i+1) - 1 ) = out ;

end

% -------------------------------------------------------------------------
disp(' Join the vector input')
input = zeros(mn) ;
for band = 1 :mn(3)
    for k = 1 : mn(1) % rows
        indexHz = 1 + 4*(k-1) : 4*k ;
        indexHz = indexHz + (band -1)*4*mn(1);
        input(k,1:4 ,band) = inHz( indexHz ) ; % [Hz(i,j), Hz(i,j+1), Hz(i,j-1), Hz(i+1,j), ...
        input(k,5:8 ,band) = inEx( indexHz ) ; % Ex(i,j), Ex(i,j+1), Ex(i,j-1), Ex(i+1,j), ...
        input(k,9:12,band) = inEy( indexHz ) ; % Ey(i,j), Ey(i,j+1), Ey(i,j-1), Ey(i+1,j) ] ;
    end
end


% target : Yij(cont,:) = [Hz(i+1,j), ...
%                         Ex(i+1,j), ...
%                         Ey(i+1,j) ] ;

% -------------------------------------------------------------------------
disp(' Separate the vector of target')

mn = size(target) ; %  64    3   299
tgHz = zeros(1,mn(1)*mn(3)) ;
tgEx = zeros(1,mn(1)*mn(3)) ;
tgEy = zeros(1,mn(1)*mn(3)) ;
cont = 1 ;
for band = 1 :mn(3)
    for k = 1 : mn(1) % rows        
        tgHz( cont ) = target(k,1 ,band) ; % [Hz(i,j), Hz(i,j+1), Hz(i,j-1), Hz(i+1,j), ...
        tgEx( cont ) = target(k,2 ,band) ; % Ex(i,j), Ex(i,j+1), Ex(i,j-1), Ex(i+1,j), ...
        tgEy( cont ) = target(k,3,band) ; % Ey(i,j), Ey(i,j+1), Ey(i,j-1), Ey(i+1,j) ] ;
        cont = cont + 1 ;
    end
end

% -------------------------------------------------------------------------
disp(' Scale partition uniform of size S')
mn_tgHz = size(tgHz) ;
index = 1 : S : mn_tgHz(2) + S  ;
for i = 1 : length(index) - 1

    % Hz
tmp = tgHz( index(i) : index(i+1) - 1 ) ;
[ out , MAX , MIN ] = my_mat2gray( tmp ) ;
tgHz( index(i) : index(i+1) - 1 ) = out ;

    % Ex
tmp = tgEx( index(i) : index(i+1) - 1 ) ;
[ out , MAX , MIN ] = my_mat2gray( tmp ) ;
tgEx( index(i) : index(i+1) - 1 ) = out ;

    % Ey
tmp = tgEy( index(i) : index(i+1) - 1 ) ;
[ out , MAX , MIN ] = my_mat2gray( tmp ) ;
tgEy( index(i) : index(i+1) - 1 ) = out ;

end

% -------------------------------------------------------------------------
disp(' Join the vector target')
target = zeros(mn) ;
cont = 1 ;
for band = 1 :mn(3)
    for k = 1 : mn(1) % rows        
        target(k,1 ,band) = tgHz( cont ) ; % [Hz(i,j), Hz(i,j+1), Hz(i,j-1), Hz(i+1,j), ...
        target(k,2 ,band) = tgEx( cont ) ; % Ex(i,j), Ex(i,j+1), Ex(i,j-1), Ex(i+1,j), ...
        target(k,3 ,band) = tgEy( cont ) ; % Ey(i,j), Ey(i,j+1), Ey(i,j-1), Ey(i+1,j) ] ;
        cont = cont + 1 ;
    end
end

% overal scaling
max(max(max(input)))
% input = mat2gray(input) ;
% target = mat2gray(target) ;

% inputTest = input( 

[time,net] = LSTM_PML2(input,target)
