program sawtooth
! This program generates points that can be plotted to form a sawtooth
! Assignment 01
implicit none

double precision :: x, y, pi
integer :: i

pi = 4.0*atan(1.0)

x = 0.0

open(unit = 100, file='sawtooth.dat')
write(100,*)'# x-value          y-value'
do i = 0, 10000
    if (x >= 0 .and. x < pi) then
        y = x
    elseif(x > pi .and. x <= 2.0*pi) then
        y = x - 2.0*pi
    else
        exit
    end if
    write(100,*)x,y
    x = x + 0.1
end do

end program sawtooth