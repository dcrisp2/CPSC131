function CartDisplay1(X)
%Display x=X(1) and q=X(2);

x=X(1);q=X(2);
hold off
plot(handles.axes1,[-2 2],[2 -2],'.')
hold on
plot(handles.axes1,[-2 2],[0 0],'-')
% Draw the box
x1=x; y1=0;
plot([handles.axes1,x1-0.2, x1+0.2,x1+0.2,x1-0.2,x1-0.2], [0,0,0.1,0.1,0],'-');

%Draw Pendulum
x2=x1+sin(q);y2=y1-cos(q);
plot(handles.axes1,[x1,x2],[y1,y2],'r-');
plot(handles.axes1,[x2-0.05,x2+.05,x2+.05,x2-.05,x2-.05],[y2-0.05,y2-0.05,y2+0.05,y2+0.05,y2-0.05],'-');
pause(0.01);
end