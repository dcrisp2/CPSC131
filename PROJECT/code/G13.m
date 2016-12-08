function varargout = G13(varargin)
% G13 MATLAB code for G13.fig
%      G13, by itself, creates a new G13 or raises the existing
%      singleton*.
%
%      H = G13 returns the handle to a new G13 or the handle to
%      the existing singleton*.
%
%      G13('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in G13.M with the given input arguments.
%
%      G13('Property','Value',...) creates a new G13 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before G13_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to G13_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help G13

% Last Modified by GUIDE v2.5 08-Dec-2016 16:02:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @G13_OpeningFcn, ...
                   'gui_OutputFcn',  @G13_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before G13 is made visible.
function G13_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to G13 (see VARARGIN)

% Choose default command line output for G13
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes G13 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = G13_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% Update handles structure
guidata(hObject, handles);

% Set Parameters
syms t;
c = 2.99792458 * 10^8; %Speed of light (m/s)
beta = 0.02; %Fractional Speed w.r.t. 'c'
v = beta*c; %Speed on ions (m/s)
t0 = 0;
h = 10^-9;
L = [8, 4, 8]; %Region Lengths
B = [0 0 0; 0 .2 0; 0 0 0]; %Region Magnetic Field Vectors
X0 = [0 0 0]; %Position, meter
    X1(1,:) = X0;
V0 = [0 0 v]; %Velocity, meters/second
    V1(1,:) = V0;

%Ion Species
a = 39; %Mass of Radioactive Potassium
q = 15; %Stripped of 15 electrons, charge-->15+

% Get User Values
n1=str2num(get(handles.xx,'String'));
n2=str2num(get(handles.yy,'String'));
n3=str2num(get(handles.dx,'String'));
n4=str2num(get(handles.dy,'String'));
n5=str2num(get(handles.dz,'String'));

X0 = [n1 n2 0];
    Xn(1,:) = X0;
V0 = [n3*c n4*c n5*c];
    Vn(1,:) = V0;

%% Region 1: Drift
%   Border Values were given as input
fprintf('\nREGION 1: DRIFT\n');
[A1, V1, X1 ] = get_equations(q,a,V0,B(1,:),X0);

t1 = eval(solve(X1(3)==L(1),t)); %time in region 1
T1 = t0:h:t1; %time inside R1 (in steps of 'h')
T = T1; %total time inside R1 (in steps of 'h'). So that I can keep T1 for later

nums(1) = length(T1); %number of time steps in R2.
for i=2:nums(1) %Xn(1,:) already defined w/ X0
    Xn(i,:) = eval(subs(X1,t,T(i))); %Maybe should use T1...
    % display position(x); angel(q);  velocity(dx) ;angular velocity(dy)
    set(handles.text1,'String',num2str(Xn(i,1)));
    set(handles.text2,'String',num2str(Xn(i,2)));
    set(handles.text3,'String',num2str(Xn(i,3)));
end

%R1 stepped positions + times
[time, Xpos, Ypos, Zpos] = get_vals(T,Xn,1,length(T));
%plot time vs. Z, and Z vs. X
%justPlot(1,time,Zpos,Zpos,Xpos); 

%% Region 2: Dipole
fprintf('\nREGION 2: DIPOLE\n');
[V0, X0 ] = get_values(X1, V1, t1+h); %First values [1x3] inside R2 from R1 equations
    Xn(nums(1)+1,:) = X0; %To keep all stepped values in sync, and process portion consistant
    
[A2, V2, X2 ] = get_equations(q,a,V0,B(2,:),X0); %Return R2 Equations
    Xoffset = eval(subs(X2,t,t1+.5*h))-eval(subs(X1,t,t1+.5*h)); %Offset (difference) of X1 and X2 @ border
    X2 = X2-Xoffset; %normalized X at 1-2 border. (i.e. X1@(t1+.5*h)==X2@(t1+.5*h))
    
t2 = eval(solve(X2(3)==sum(L(1:2)),t)); %total time at end of R2
T2 = t1+h:h:t1+t2; %time inside R2 (in steps of 'h')
T=cat(2,T,T2); %total time inside R1 and R2 (in steps of 'h')

nums(2) = length(T2); %number of time steps in R2. length(T)==sum(nums(1:2))
for i=nums(1)+2:sum(nums(1:2))
    Xn(i,:) = eval(subs(X2,t,T(i)));% Xn(nums(1)+1,:) should = X0
    % display position(x); angel(q);  velocity(dx) ;angular velocity(dy)
    set(handles.text1,'String',num2str(Xn(i,1)));
    set(handles.text2,'String',num2str(Xn(i,2)));
    set(handles.text3,'String',num2str(Xn(i,3)));
end

%R2 stepped positions + times
[time, Xpos, Ypos, Zpos] = get_vals(T,Xn,1,length(T));
%plot time vs. Z, and Z vs. X
%justPlot(2,time,Zpos,Zpos,Xpos);
    
%% Region 3: Drift
fprintf('\nREGION 3: DRIFT\n');
[V0, X0 ] = get_values(X2, V2, t2+h); %First values [1x3] inside R3 from R2 equations
    Xn(nums(2)+1,:) = X0; %To keep all stepped values in sync, and process portion consistant
    
[A3, V3, X3 ] = get_equations(q,a,V0,B(3,:),X0); %Return R3 Equations
    Xoffset = eval(subs(X3,t,t2+.5*h))-eval(subs(X2,t,t2+.5*h)); %Offset (difference)@border
    X3 = X3-Xoffset; %normalized X at 2-3 border. (i.e. X1@(t1+.5*h)==X2@(t1+.5*h))
    
t3 = eval(solve(X3(3)==sum(L(1:3)),t)); %total time at end of R3
T3 = t2+h:h:t2+t3; %time inside R3 (in steps of 'h')
T=cat(2,T,T3); %total time inside R1, R2 and R3 (in steps of 'h')

nums(3) = length(T3); %number of time steps in R2. length(T)==sum(nums(1:2))
for i=nums(2)+2:sum(nums(1:3))
    Xn(i,:) = eval(subs(X3,t,T(i)));% Xn(nums(1)+1,:) should = X0
    % display position(x); angel(q);  velocity(dx) ;angular velocity(dy)
    set(handles.text1,'String',num2str(Xn(i,1)));
    set(handles.text2,'String',num2str(Xn(i,2)));
    set(handles.text3,'String',num2str(Xn(i,3)));
end

%R1 stepped positions + times
[time, Xpos, Ypos, Zpos] = get_vals(T,Xn,1,length(T));
%plot time vs. Z, and Z vs. X
%justPlot(3,time,Zpos,Zpos,Xpos);


axes(handles.axes1)
plot(handles.axes1,Zpos,Xpos);
a
hold on;


guidata(hObject, handles);

function xx_Callback(hObject, eventdata, handles)
% hObject    handle to xx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xx as text
%        str2double(get(hObject,'String')) returns contents of xx as a double






% --- Executes during object creation, after setting all properties.
function xx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yy_Callback(hObject, eventdata, handles)
% hObject    handle to yy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yy as text
%        str2double(get(hObject,'String')) returns contents of yy as a double


% --- Executes during object creation, after setting all properties.
function yy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dx_Callback(hObject, eventdata, handles)
% hObject    handle to dx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dx as text
%        str2double(get(hObject,'String')) returns contents of dx as a double


% --- Executes during object creation, after setting all properties.
function dx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dy_Callback(hObject, eventdata, handles)
% hObject    handle to dy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dy as text
%        str2double(get(hObject,'String')) returns contents of dy as a double


% --- Executes during object creation, after setting all properties.
function dy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dz_Callback(hObject, eventdata, handles)
% hObject    handle to dz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dz as text
%        str2double(get(hObject,'String')) returns contents of dz as a double


% --- Executes during object creation, after setting all properties.
function dz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function B_Callback(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of B as text
%        str2double(get(hObject,'String')) returns contents of B as a double


% --- Executes during object creation, after setting all properties.
function B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
