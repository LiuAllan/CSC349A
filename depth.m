%critical depth function
function [ fy ] = depth( y )

fy = 1 - 20.^2./(9.81.*(3.*y+y.^2./2).^3).*(3+y);

end
