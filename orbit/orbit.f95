program orbit
implicit none


integer :: i, n
double precision :: pi, mass, time, step, mag_r, mag_v, gm, period, orbits
double precision :: potential, kinetic, total
double precision, dimension(3) :: r, v, r_temp, v_temp, a_temp
double precision, dimension(6) :: k1, k2, k3, k4, earth_state, state_temp

pi = 4.0 * atan(1.0)
gm = 4.0*pi**2
mass= 1.0
time = 0.0
step = 0.0001

r = 0.0
r(1) = 1.0
v = 0.0
v(2) = 2.0*pi

mag_r = norm2(r)
mag_v = norm2(v)

period = sqrt(mag_r**3)

print*, 'How many orbits would you like?'
read*, orbits

n = ceiling(period/step*orbits)

earth_state(1:3) = r
earth_state(4:6) = v

kinetic = 0.5*mass*mag_v**2
potential = -gm*mass/mag_r
total = kinetic + potential

open(unit = 100, file = 'position.dat')
open(unit = 110, file = 'velocity.dat')
open(unit = 120, file = 'kinetic.dat')
open(unit = 130, file = 'potential.dat')
open(unit = 140, file = 'totalEnergy.dat')

write(100, *) r
write(110, *) v
write(120, *) time, kinetic
write(130, *) time, potential
write(140, *) time, total

do i = 1, n
    state_temp = earth_state
    r_temp = state_temp(1:3)
    v_temp = state_temp(4:6)
    mag_r = norm2(r_temp)
    a_temp = -4.0*pi**2/mag_r**3*r
    k1(1:3) = v_temp
    k1(4:6) = a_temp

    state_temp = earth_state + 0.5*step*k1
    r_temp = state_temp(1:3)
    v_temp = state_temp(4:6)
    mag_r = norm2(r_temp)
    a_temp = -4.0*pi**2/mag_r**3*r
    k2(1:3) = v_temp
    k2(4:6) = a_temp

    state_temp = earth_state + 0.5*step*k2
    r_temp = state_temp(1:3)
    v_temp = state_temp(4:6)
    mag_r = norm2(r_temp)
    a_temp = -4.0*pi**2/mag_r**3*r
    k3(1:3) = v_temp
    k3(4:6) = a_temp

    state_temp = earth_state + step*k3
    r_temp = state_temp(1:3)
    v_temp = state_temp(4:6)
    mag_r = norm2(r_temp)
    a_temp = -4.0*pi**2/mag_r**3*r
    k4(1:3) = v_temp
    k4(4:6) = a_temp

    earth_state = earth_state + step/6.0*(k1+2.0*k2+2.0*k3+k4)
    time = time + step
    r = earth_state(1:3)
    v = earth_state(4:6)
    mag_r = norm2(r)
    mag_v = norm2(v)
    kinetic = 0.5*mass*mag_v**2
    potential = -gm*mass/mag_r
    total = kinetic + potential
    write(100, *) r
    write(110, *) v
    write(120, *) time, kinetic
    write(130, *) time, potential
    write(140, *) time, total
end do

end program