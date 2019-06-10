program freefallEuler
implicit none

double precision :: y, v, dt, g, t
integer :: i

t = 0.0
g = -9.81

print*, 'Enter a starting height:'
read*, y

print*, 'Enter an initial velocity'
read*, v

print*, 'Enter a time step'
read*, dt

open(unit=100,file='yVStEuler.dat')
open(unit=110,file='vVStEuler.dat')
open(unit=120,file='aVStEuler.dat')
write(100,*) t, y
write(110,*) t, v
write(120,*) t, g

do while (y >= 0.0)
    y = y + dt * v
    v = v + dt * g
    t = t + dt
    write(100,*) t, y
    write(110,*) t, v
    write(120,*) t, g
end do

print*, 'The object hit the groun in ', t, ' seconds.'
print*, 'The impact speed was ', abs(v), ' m/s.'

end program