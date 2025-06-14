#!/usr/bin/sage

def kern(x1,y1,z1,x2,y2,z2):
    return y1*z2 - y2*z1, z1*x2 - z2*x1, x1*y2 - x2*y1

def perppoint(Lx,Ly,x,y):
    return (-Lx*x - Ly*y)

R.<x0,y0> = ZZ[]

p1x,p1y = 0,0
p2x,p2y = 1,0
p3x,p3y = x0,y0

L1x,L1y,L1z = kern(p2x,p2y,1,p3x,p3y,1)
L2x,L2y,L2z = kern(p3x,p3y,1,p1x,p1y,1)
L3x,L3y,L3z = kern(p1x,p1y,1,p2x,p2y,1)

# Proof of co-location of altitude lines
M1x,M1y,M1z = -L1y,L1x,perppoint(-L1y,L1x,p1x,p1y)
M2x,M2y,M2z = -L2y,L2x,perppoint(-L2y,L2x,p2x,p2y)
M3x,M3y,M3z = -L3y,L3x,perppoint(-L3y,L3x,p3x,p3y)

D = det(matrix([
    [M1x,M1y,M1z],
    [M2x,M2y,M2z],
    [M3x,M3y,M3z],
    ]))

assert D.parent() is R

print(D)

# Proof of co-location of perpendicular bisectors
m1x,m1y = p2x + p3x,p2y + p3y
m2x,m2y = p3x + p1x,p3y + p1y
m3x,m3y = p1x + p2x,p1y + p2y

M1x,M1y,M1z = -2*L1y,2*L1x,perppoint(-L1y,L1x,m1x,m1y)
M2x,M2y,M2z = -2*L2y,2*L2x,perppoint(-L2y,L2x,m2x,m2y)
M3x,M3y,M3z = -2*L3y,2*L3x,perppoint(-L3y,L3x,m3x,m3y)

D = det(matrix([
    [M1x,M1y,M1z],
    [M2x,M2y,M2z],
    [M3x,M3y,M3z],
    ]))

assert D.parent() is R

print(D)

# Proof of co-location of median lines is trivial from preservation of
# midpoints under affine transformations

# Proof of bisector co-location: start with circle and draw triangle
# around it so that circle is triangle's inscribed circle.  Easy to see
# that any similarity class can be obtained this way.  Then center of
# circle is co-location of bisectors.

# Napolean
# In complex plane
R.<zeta,z> = QQ[]
zeta,z = R.quotient(zeta^3 - 1).gens()

z1,z2,z3 = 0,1,z

# Find third point in `circumscribed' eq triangles
t1 = -zeta*z2 - zeta^2*z3
t2 = -zeta*z3 - zeta^2*z1
t3 = -zeta*z1 - zeta^2*z2

# Center points of circumscribed eq triangles
c1 = t1 + z2 + z3
c2 = t2 + z3 + z1
c3 = t3 + z1 + z2

print(c1 + zeta^2 * c2 + zeta * c3)
