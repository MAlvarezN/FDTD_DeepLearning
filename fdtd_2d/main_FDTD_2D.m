% -------------------------------------------------------------------------
%           FDTD 2D 2-D - TMz mode wave propagation
%
% This main solve Maxwell Eqs for TMz schema i.e. Ez,Hx,Hy system.
% 
% PML boundary conditions was done using:
%       2016 - Atef Z. Elsherbeni and Veysel Demir -
%       The finite-difference time-domain method for electromagnetics 
%       with MATLAB simulations
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% Clean path, figures, workspace
restoredefaultpath
close all;
clear;
clc;

% -------------------------------------------------------------------------
% Define the problem , skin-geometry to use , plot parameters
tipo_geometria = 'Fig2a' ; %input(' Define geometry: ') ;
define_parameters
plot_parameters

% -------------------------------------------------------------------------
% Initialize fields and coeficients
disp('Creating field arrays');
initial_Fields_Coeficients

% -------------------------------------------------------------------------
% Initialize PML boundary conditions for TMz mode
disp(' start PML - TMz');
initial_PML_TMz

% -------------------------------------------------------------------------
% FDTD time-loop
fdtd_time_loop

% -------------------------------------------------------------------------
% Save Results
% % save_results