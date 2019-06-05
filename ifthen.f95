program ifthen
! This Program calculates y for several values of x for a discontinuous function
implicit none

double precision :: x, y
integer :: i

x = -1.0

open(unit = 100, file = 'ifthen.dat')
write(100,*) '#     x-value             y-value'

do i = 1,250
    if(x < 2.0) then
        y = x
    elseif(x <= 3.5) then
        y = x**2.0 - 2.0
    elseif(x < 10.0) then
        y = (3.5**2.0 - 2.0) - cos(3.5) + cos(x)
    else
        exit
    endif

    write(100,*) x,y

    x = x + 11.0 / 150.0
end do
close(100)
end program ifthen