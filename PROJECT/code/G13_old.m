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

% Last Modified by GUIDE v2.5 15-Nov-2016 15:55:51

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
    X1(1,:) = X0;
V0 = [n3*c n4*c n5*c];
    V1(1,:) = V0;

dt = 0.01;
X=[n1;n2;n3;n4;n5];
for i=1:1000
    dX=CartDynamics(X);
    X=CartI(X,dX,dt);
    % display position(x); angel(q);  velocity(dx) ;angular velocity(dy)
    set(handles.text1,'String',num2str(X(1)));
    set(handles.text2,'String',num2str(X(2)));
    set(handles.text3,'String',num2str(X(3)));
    set(handles.text4,'String',num2str(X(4)));
    set(handles.text5,'String',num2str(X(5)));
    % CartDisplay1(X);
    x=X(1);q=X(2);
hold off
plot(handles.axes1,[-2 2],[2 -2],'.')
hold on
plot(handles.axes1,[-2 2],[0 0],'-')
% Draw the box
x1=x; y1=0;
plot(handles.axes1,[x1-0.2, x1+0.2,x1+0.2,x1-0.2,x1-0.2], [0,0,0.1,0.1,0],'-');

%Draw Pendulum
x2=x1+sin(q);y2=y1-cos(q);
plot(handles.axes1,[x1,x2],[y1,y2],'r-');
plot(handles.axes1,[x2-0.05,x2+.05,x2+.05,x2-.05,x2-.05],[y2-0.05,y2-0.05,y2+0.05,y2+0.05,y2-0.05],'-');
pause(0.1);
    
end

%guidata(hObject, handles);

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
