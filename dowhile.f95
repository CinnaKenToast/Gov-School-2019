program dowhile
! This program caluclates the sin for several values using a do loop that can be plotted
implicit none

double precision :: x, y, x_in_degrees, pi
integer :: i

x = 0.0

open(unit=100, file='dowhile.dat')
pi = 4.0 * atan(1.0)
write(100,*) "# x-values                 y-values"

do while (x <= 2 * pi)
    y = sin(x)
    x_in_degrees = x * 100.0/pi
    write(100,*) x_in_degrees, y
    x = x + 0.1
end do
close(100)
end program