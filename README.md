# Robotic-Manipulator-Fwd-Kinematics-Code
Forward Kinematics code for robotic manipulator having any number of DOF

Code takes the Distal DH parameters of any robotic manipulator, the target frame and the reference frame as user inputs, and outputs the composite homogeneous transformation matrix for the two input frames. This code also functions as the distal DH paramater to  proximal DH parameter converter, where the user can get equivalent proximal DH transformation matrix for a given set of distal DH parameters.
The distal DH parameters are to be input in a seperate textfile. As an example, the human legs with one leg stanced and one leg swinging have been considered having 6 degrees of freedom.
