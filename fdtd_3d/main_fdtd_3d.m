% 
% oldpath = path ;
% path(oldpath,'.\myfunctions\')
%
clear; 
close all;
clc

tic
% Initial Setup
nT = 200 ; % Total number of iterations
initial_setup

% Create materials: \epsilon and \mu
create_materials

% Ex , Ey , Ez ; Hx , Hy , Hz   
create_matrices_E_H

% C_ constants
create_matrices_constants

% Time-Loop to update E & H
disp('Start loop')
% return
for nt = 1 : nT
    progress = nt/nT
    apply_source    
    update_E_H      
    graph_results
end

disp('END main')
toc
% -------------------------------------------------------------------------    