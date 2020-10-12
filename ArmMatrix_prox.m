%**************************************************************************
%************** FUNCTION TO CALCULATE THE ARM MATRIX **********************
%**************************************************************************

function [A,flag] = ArmMatrix_prox(A, InputFile)
%this function extracts information from the Distal DH table input by the
%user and converts it into proximal DH parameters

global NJ NF DOF theta DH_varaint

fid = fopen(InputFile,'r');
if(fid == -1 ) display('File Not Found !!!'); return; end

% INPUT VARIBLES
NJ = fscanf(fid,'%d',1);
DOF = fscanf(fid,'%d',1);
DH_variant = fscanf(fid,'%d',1);
start_frame = fscanf(fid,'%d',1);
ending_frame = fscanf(fid,'%d',1);
NF = NJ + 1;

if(NJ<1) display('Wrong Input !!! Please Check the No. of Joints.');return; end

alpha = zeros(NF,1);    % alpha(k)  =   Twist Angle (Angle b/w Z(k-1) & Z(k) along X(k))
a = zeros(NF,1);        % a(k)      =   Link Length (Distance from Z(k-1) to Z(k) along X(k))
theta = zeros(NF,1);    % theta(k)  =   Joint Angle (Angle b/w X(k-1) & X(k) along Z(k-1)
d = zeros(NF,1);        % d(k)      =   Joint Offset(Distance from X(k-1) to X(k) along Z(k-1)
flag = zeros(NF,1);     % flag(k)   =   Decision about the Joint Type (Rotational(flag=1) or Prismatic (flag=0)) 
dQ_dt = zeros(NF,1);    % dQ_dt(k)  =   Actuator Velocity

for k=1:NJ
    alpha(k+1) = fscanf(fid,'%f',1)*pi/180;
    a(k+1) = fscanf(fid,'%f',1);
    d(k) = fscanf(fid,'%f',1);
    theta(k) = fscanf(fid,'%f',1)*pi/180;
    dQ_dt(k) = fscanf(fid,'%f',1);
    flag(k) = fscanf(fid,'%d',1);
end
% d(NJ+1) = 0.1;%adding any additional values of parameters which may not
% be included in the distal DH table

% CALCULATE THE ARM MATRIX
for k = 1:NJ
     %here the tranformation from the base frame to the 1st frame is not taken into account
    A(:,:,k) =   [cos(theta(k+1)),-sin(theta(k+1)),0,a(k+1);sin(theta(k+1))*cos(alpha(k+1)),cos(alpha(k+1))*cos(theta(k+1)),-sin(alpha(k+1)),-d(k+1)*sin(alpha(k+1));sin(theta(k+1))*sin(alpha(k+1)),sin(alpha(k+1))*cos(theta(k+1)),cos(alpha(k+1)),d(k+1)*cos(alpha(k+1));0,0,0,1];
end  

