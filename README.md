# Robotic-Manipulator-Fwd-Kinematics-Code
Forward Kinematics code for robotic manipulator having any number of DOF. For a given set of link parameters and joint variables of any manipulator and the reference frame number and the tip frame number, the code outputs the concatenated homogenous transformation matrix from the reference frame to the tip frame.

The code takes the link parameter and joint varriable inputs in the form of a distal DH parameter table, where link rotation and link length are the link parameters and joint rotation (for revolute joints) and joint translation (for prismatic joints) are the joint variables. 

This code also functions as the distal DH paramater to  proximal DH parameter converter, where the user can get equivalent proximal DH transformation matrix for a given set of distal DH parameters. Important thing to note is that the user doesn't need to know how to construct the proximal DH table (which is quite similar to the distal DH table but a little more difficult to conceptualize) or how to assign the frames according to the proximal DH parameters. This is done as frame assignment according to distal DH parameters and constructing a distal DH table is much more widely known and used. 

The distal DH parameters are to be input in a seperate text file. As an example, the human legs with one leg stanced and one leg swinging have been considered having 6 degrees of freedom. The text file where the user has to input the table is given by: `dhParametersHumanLeg.txt`.

Explanation of the included scripts:

1). `fwdKin_robotic_manipulator.m`: This is the mother script which needs to be exectuted in order run the solver. It basically parses the DH table text file and depending on the result the user wants (proximal or distal), runs the corresponding script.

2). `fwdKin_RoboticManipulator_distalDH,m`: this is the script which is executed by the mother script if the user needs the result according to distal DH parameters.

3). `fwdKin_RoboticManipulator_proximalDH,m`: this is the script which is executed by the mother script if the user needs the result according to proximal DH parameters.

4). `ArmMatrix_distal.m`: this is a function which is used in the `fwdKin_RoboticManipulator_distalDH,m` script to calculate the homogenous transformation matrix from one frame to the adjacent frame. 

5). `ArmMatrix_proximal.m`: this is a function which is used in the `fwdKin_RoboticManipulator_proximalDH,m` script to calculate the homogenous transformation matrix from one frame to the adjacent frame. The variables used in the matrix for proximal DH parameters are a little different than distal DH and thus a seperate function is created. Moreover, this function performs the task of converting the input distal DH table to the equivalent proximal DH table.

6). `T_Concat_distal.m`: This is the function which calculates the final concatenated transformation matrix for the two input frames. This function is for the distal DH parameters.

7). `T_Concat_proximal.m`: This is the function which calculates the final concatenated transformation matrix for the two input frames. This function is for the proximal DH parameters.

