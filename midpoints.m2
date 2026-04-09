-- This is trivialy from the fact that every triangle is an affine
-- transformation of the equilateral triangle, and the fact that
-- midpoints are invariant under such transformations.

-- Buts let's do it anyway

mnrs = m -> matrix{{det(m_{1,2}),det(m_{2,0}),det(m_{0,1})}}

R = QQ[a,b]

l1 = mnrs(matrix{{0,0,1},{(a+1)/2,b/2,1}})
l2 = mnrs(matrix{{1,0,1},{a/2,b/2,1}})
l3 = mnrs(matrix{{a,b,1},{1/2,0,1}})

<< det(l1||l2||l3) == 0 and det((l1||l2)_{1,2}) != 0 << endl

exit 0
