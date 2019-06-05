program sawtoothFourier
! This program generates points that approximates a sawtooth
! Assignment 01
implicit none

double precision :: x, y, fourier, b, pi
integer :: i, j, n

pi = 4.0*atan(1.0)

x = 0.0

write(*,*) 'Number of terms in the fourier series: '
read(*,*) j

open(unit = 100, file='sawtoothFourier.dat')
write(100,*)'# x-value          y-value'
do x = 0, 2*pi, 0.01
    fourier = 0.0
    do n = 1, j
        b = ((-1)**(n+1)*2.0)/n
        fourier = fourier + b * sin(n*x)
    end do
    write(100,*)x,fourier
end do

end program sawtoothFourier