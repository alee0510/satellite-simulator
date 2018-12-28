# MATLAB & Simulink : Satellite Simulator
 This software is built with MATLAB and Simulink. With this simulator we can visualize the orbit and attitude of the satellite in 2D graph or 3D animation. In propagating of an orbit and attitude of the satellite, it’s related with perturbations and environments in out of the body of the satellite. Environments model in this simulator is the Earth’s magnetic field

# Satellite Discriptions
Satellite Type  : Virtual Satellite
Weight          : ±3.5 kg
Class           : Nano Satellite
Shape           : Cube with 13x13x30 cm dimention
Main Sensor     : Sun sensor
Actuator        : Magnetorquers
Orbit           : Low Earth's Orbit (LEO) or Polar Orbit with ±96.9980 degree inclination and altitude ±630 km

# Environtments : Earth's Geomagnetic Field
The Earth’s magnetic field model in this simulator is used as a model of magnetometer in the satellite, this value of the magnetic field is used as reference to consider how much current must be flowing through the coil to gain a torque (result of the interaction between Earth’s magnetic field and magnetorquers, cross product) that is used to control the attitude of satellite

# To DO
To run the simulator just open file .slx in Matlab Simulink and if you want to visualize in 3D just comment out the block output