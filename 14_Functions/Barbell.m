function [SA, Vol]= Barbell(r1,r2,h)                                                                               
% This function finds the surface area and volume of a barbell (ignoring 
%   fact that the ends of the bartake away from the SA and vol of the
%   sphere)
% INPUTS: r1, the radius of the sphere
%         r2, radius of the cylinder, scalar
%         h, the height of the cylinder, scalar
% OUTPUTS: SA, surface area of the barbell, scalar
%          Vol, volume of the barbell, scalar
% Sample call:  [SABarbell VolBarbell] = Barbell(4,.5,10)
 
[SA1,Vol1] = SAVolSphere(r1);
[SA2,Vol2] =  SAVolCylinder(r2,h);
SA = 2*SA1+SA2;
Vol = Vol1+Vol2; 
%======================================================================
function [SA, Vol]= SAVolSphere(r)
% This function finds the surface area and volume of a sphere given its radius
SA = 4*pi*r^2;
Vol = 4/3*pi*r^3; 
%=====================================================================
function [SA, Vol] = SAVolCylinder(r,h)
%  Thus function finds the surface area and volume of
%  an open cylinder with radius r and height h.
SA = 2*pi*r*h;
Vol = pi*r^2*h;




                                                                               
