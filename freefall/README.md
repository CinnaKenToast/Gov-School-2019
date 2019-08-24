# Free Fall Assignment
The assignment was to model a ball in free fall using Euler's method, modified Euler's method, and midpoint method.
Input the starting height, initial velocity, and time step for the ball. The program will calculate the time and impact speed of the ball.
The program will also generate data points for the position, velocity, and acceleration.

### How to run program with Linux

1. Compile program
```
gfortran freefallEuler.f95
```
2. Run executable
```
./a.out
```
3. Input variables
```
 Enter a starting height:
100
 Enter an initial velocity
0
 Enter a time step
0.01
 The object hit the ground in    4.5299999999999478       seconds.
 The impact speed was    44.439301900863754       m/s.
```
4. Plot points
```
gnuplot

plot "yVStEuler.dat" w l, "yVStEuler.dat" w l, "aVStEuler.dat" w l
```

Results for free fall calculated with Euler's method
![][Euler]

Results for free fall calculated with modified Euler's method
![][EulerMod]

Results for free fall calculated with midpoint method
![][Midpoint]

[Euler]: images/Euler.png "Euler"
[EulerMod]: images/EulerMod.png "Euler Modified"
[Midpoint]: images/Mid.png "Midpoint"
