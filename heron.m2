-- Heron's Formula
R = QQ[x,y,a,b]/(a^2 - x^2 - y^2,b^2 - (x-1)^2 - y^2)
-- c = 1

s = (a + b + 1)/2
rdcand = s*(s - a)*(s-b)*(s-1)

<< rdcand - y^2/4 == 0 << endl

exit 0
