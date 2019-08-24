program freefallAirDrag
    implicit none
    
    double precision :: y, y0, v, dt, g, t, aDrag, a, mass, radius, pi, airDensity, area, dragCoeff, b
    integer :: i
    
    print*, 'Enter a starting height:'
    read*, y0
    
    print*, 'Initial velocity is zero'
    v = 0.0

    print*, 'Enter a time step'
    read*, dt
    
    pi = atan(1.0)*4.0
    dragCoeff = 0.47
    radius = 0.0369
    area = pi * radius ** 2.0
    airDensity = 1.225
    mass = .145


    t = 0.0
    g = 9.81
    a = 9.81
    b = (dragCoeff * airDensity * area) / (2.0 * mass)
    open(unit=100,file='yVStAirDragNumerical.dat')
    open(unit=110,file='vVStAirDragNumerical.dat')
    open(unit=120,file='aVStAirDragNumerical.dat')
    write(100,*) t, y
    write(110,*) t, v
    write(120,*) t, g
    
    do while (y >= 0.0)
        y = y0-1.0d0/b*log(dcosh(sqrt(b*g)*t))
        v = sqrt(g/b)*dtanh(-sqrt(b*g)*t)
        a = -b*v*abs(v) - g
        write(100,*) t, y
        write(110,*) t, v
        write(120,*) t, a
        t = t + dt
    end do
    
    print*, 'The object hit the ground in ', t, ' seconds.'
    print*, 'The impact speed was ', abs(v), ' m/s.'
    
    end program