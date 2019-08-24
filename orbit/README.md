# Free Fall Assignment
The assignment was to model the orbit of Earth by approximating it with RK4. Input the number of orbits for Earth. The program will generate data points for the position, velocity, potential energy, and total energy.

### How to run program with Linux

1. Compile program
```
gfortran orbit.f95
```
2. Run executable
```
./a.out
```
3. Input variables
```
 How many orbits would you like?
1
```
4. Plot points
```
gnuplot

plot "position.dat" w l, "velocity.dat" w l

plot "potential.dat" w l, "totalEnergy.dat" w l
```

Results for the orbit position and velocity
![][orbit]

Results for the orbit potential energy and total energy
![][energy]

[orbit]: images/orbit.png "Orbit"
[energy]: images/energy.png "Energy"
