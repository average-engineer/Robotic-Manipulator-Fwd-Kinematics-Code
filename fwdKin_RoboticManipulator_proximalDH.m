%**************************************************************************
%**** FORWARD KINEMATICS (3D) of Any DOF's ROBOT USING PROXIMAL DH PARAMETERS**
%**************************************************************************
% WHERE
% NJ = Number of Joints 
% NF = Number of Frames
% DOF = Degree of Freedom of the Cartesian Space
% flag = Decision about the Joint Type 
% For Rotary Joint (Flag=1),
% For Prismatic Joint (Flag=0)
%**************************************************************************
%% SETTINGS
clc
clear all
close all
format bank

% GLOBAL VARIABLES
global NJ NF DOF theta DH_variant


%DATA FILES    
inputFileDHP = 'dhParametersHumanLeg.txt';
f3 = fopen(inputFileDHP,'r')
input_variables = fscanf(f3,'%d',5)
NJ = input_variables(1);
starting_frame = input_variables(4)+1;
ending_frame = input_variables(5)+1;

% MEMORY ALLOCATION
A = zeros(4,4,NJ+1);     % Arm Matrix 

%% FUNCTION CALLS
% Calculate homogeneous tranforms of each frame 
[A,flag] = ArmMatrix_prox(A,inputFileDHP);

% Calculate the tip to base tip to base concatenated matrix
% tip_frame = 10; % frame at Ankle tip
% base_frame = 1; % frame at hip joint

A1 = T_Concat_proximal(A,ending_frame,starting_frame); % Here  

% Plot the final concated matrix 
A1

% If you want to see the transformation martix of 8th frame
% A(:,:,8);  

% If you want to calculate the matric of ankle tip to Knee (extension)
% See fig in the paper, knee extension belongs to frame 5
% A1 = T_Concat(A,tip_frame,5);  


