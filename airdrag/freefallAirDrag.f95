program freefallAirDrag
    implicit none
    
    double precision :: y, vNew, vOld, dt, g, t, aDrag, a, mass, radius, pi, airDensity, area, dragCoeff
    integer :: i
    
    print*, 'Enter a starting height:'
    read*, y
    
    print*, 'Enter an initial velocity'
    read*, vOld
    
    print*, 'Enter a time step'
    read*, dt
    
    pi = atan(1.0)*4.0
    radius = 0.0369
    area = pi * radius ** 2.0
    mass = .145
    airDensity = 1.225
    dragCoeff = 0.47

    t = 0.0
    g = -9.81
    aDrag = -0.5 * (dragCoeff * area * airDensity * abs(vOld) * vOld)/ mass
    a = g + aDrag

    open(unit=100,file='yVStAirDrag.dat')
    open(unit=110,file='vVStAirDrag.dat')
    open(unit=120,file='aVStAirDrag.dat')
    write(100,*) t, y
    write(110,*) t, vOld
    write(120,*) t, a
    
    do while (y >= 0.0)
        vOld = vNew
        vNew = vNew + dt * a
        y = y + dt * (vNew+vOld)/2.0
        t = t + dt
        aDrag = -0.5 * (dragCoeff * area * airDensity * abs(vNew) * vNew)/ mass
        a = g + aDrag
        write(100,*) t, y
        write(110,*) t, vNew
        write(120,*) t, a
        
    end do
    
    print*, 'The object hit the ground in ', t, ' seconds.'
    print*, 'The impact speed was ', abs(vNew), ' m/s.'
    
    end program