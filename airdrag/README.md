# Air Drag Assignment
The assignment was to model a ball in free fall but with air drag in consideration. This is done both numerically and with midpoint method. Input the starting height, initial velocity, and time step for the ball. The program will calculate the time and impact speed of the ball. The program will also generate data points for the position, velocity, and acceleration.

### How to run program with Linux

1. Compile program
```
gfortran freefallAirDrag.f95
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
 The object hit the ground in    5.1799999999999340       seconds.
 The impact speed was    30.748727833417860       m/s.
```
4. Plot points
```
gnuplot

plot "yVStAirDrag.dat" w l, "yVStAirDrag.dat" w l, "aVStAirDrag.dat" w l
```

Results for free fall with air drag
![][airDrag]

Results for free fall with air drag calculated numerically
![][airDragNumerical]

[airDrag]: images/airDrag.png "Air Drag"
[airDragNumerical]: images/airDrag.png "Air Drag Numerical"

