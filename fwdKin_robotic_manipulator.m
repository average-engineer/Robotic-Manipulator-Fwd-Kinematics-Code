clear all
close all
clc

%parsing the DH table
f1 = fopen('dhParametersHumanLeg.txt','r');
input_variables = fscanf(f1,'%f',3);
dh_variant = input_variables(3);

%deciding the DH variant to be used
if dh_variant == 1
    run fwdKin_HumanLeg_distalDH
elseif dh_variant == 2
    run fwdKin_HumanLeg_proximalDH
else
    display('Error. No recognizable DH variant to be used found!')
end 
