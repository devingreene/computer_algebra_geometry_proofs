-* Proof that altitudes of triangle intersect at one point *-

R = ZZ[a,b]

-* Triangle vertices *-
p0 = matrix{{0},{0},{1}}
p1 = matrix{{1},{0},{1}}
p2 = matrix{{a},{b},{1}}

line = (x,y) -> matrix{{det((x|y)^{1,2})}}||det((x|y)^{2,0})||det((x|y)^{0,1})

l0 = line(p1,p2)
l1 = line(p2,p0)
l2 = line(p0,p1)

-- Points at infinity perpendicular from lis *-
perp0 = l0^{0,1}||0
perp1 = l1^{0,1}||0
perp2 = l2^{0,1}||0

alt0 = line(p0,perp0)
alt1 = line(p1,perp1)
alt2 = line(p2,perp2)

M = alt0|alt1|alt2
print(det(M) == 0)
-- Check for non-zero minor
print(det(M_{1,2}^{1,2}) != 0)
exit 0
