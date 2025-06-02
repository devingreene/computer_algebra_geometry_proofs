#!/usr/bin/sage

# Proof of co-location of altitude lines
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

# Proof of co-location of median lines is trivial from preservation of
# midpoints under affine transformations

# Proof of bisector co-location: start with circle and draw triangle
# around it so that circle is tangent to each side.  Easy to see that
# any similarity class can be obtained.  Then center of circle is
# co-location of bisectors.
