program freefallMidpoint
    implicit none
    
    double precision :: y, vNew, vOld, dt, g, t
    integer :: i
    
    t = 0.0
    g = -9.81
    
    print*, 'Enter a starting height:'
    read*, y
    
    print*, 'Enter an initial velocity'
    read*, vOld
    
    print*, 'Enter a time step'
    read*, dt
    
    open(unit=100,file='yVStMid.dat')
    open(unit=110,file='vVStMid.dat')
    open(unit=120,file='aVStMid.dat')
    write(100,*) t, y
    write(110,*) t, vOld
    write(120,*) t, g
    
    do while (y >= 0.0)
        vNew = vOld + dt * g
        y = y + dt * (vNew+vOld)/2.0
        t = t + dt
        write(100,*) t, y
        write(110,*) t, vNew
        write(120,*) t, g
        vOld = vNew
    end do
    
    print*, 'The object hit the ground in ', t, ' seconds.'
    print*, 'The impact speed was ', abs(vNew), ' m/s.'
    
    end program