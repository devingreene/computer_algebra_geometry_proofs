-* Proof that the perpendicular bisectors of a triangle intersect at a point *-

R = ZZ[a,b]

-* Vertices *-
p0 = matrix{{0},{0},{1}}
p1 = matrix{{1},{0},{1}}
p2 = matrix{{a},{b},{1}}

line = (x,y) ->  {a := (x|y); return matrix{{det(a^{1,2})}}||det(a^{2,0})||det(a^{0,1})}

-* Edges *-
e0 = line(p1,p2)
e1 = line(p2,p0)
e2 = line(p0,p1)

-* Points at oo perpendicular to edges *-
perp0 = e0^{0,1}||0
perp1 = e1^{0,1}||0
perp2 = e2^{0,1}||0

-* Midpoints *-
m0 = p1 + p2
m1 = p0 + p2
m2 = p0 + p1

-* Perpendicular bisectors *- 
bis0 = line(m0,perp0)
bis1 = line(m1,perp1)
bis2 = line(m2,perp2)

M = bis0|bis1|bis2
print(det(M) == 0)
-- Check one minor (see comment in mystic hexagram)
print(det(M_{1,2}^{1,2}) != 0)
exit 0
