# Air Drag Assignment

How to run program with Linux

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
 **Enter a starting height:**
100
 **Enter an initial velocity**
0
**Enter a time step**
0.01
 **The object hit the ground in    5.1799999999999340       seconds.**
 **The impact speed was    30.748727833417860       m/s.**
```
4. Plot points
```
gnuplot

plot "yVStAirDrag.dat" w l, "yVStAirDrag.dat" w l, "aVStAirDrag.dat" w l
```

