function [time, Xpos, Ypos, Zpos] = get_vals(T,Xn,nmin,nmax)
%get_vals will return more understandable values for stepped time and
%position values
    time = T(nmin:nmax);
    Xpos = Xn(nmin:nmax,1);
    Ypos = Xn(nmin:nmax,2);
    Zpos = Xn(nmin:nmax,3);
end