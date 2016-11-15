function varargout = G11(varargin)
% G11 MATLAB code for G11.fig
%      G11, by itself, creates a new G11 or raises the existing
%      singleton*.
%
%      H = G11 returns the handle to a new G11 or the handle to
%      the existing singleton*.
%
%      G11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in G11.M with the given input arguments.
%
%      G11('Property','Value',...) creates a new G11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before G11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to G11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help G11

% Last Modified by GUIDE v2.5 16-Nov-2015 17:07:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @G11_OpeningFcn, ...
                   'gui_OutputFcn',  @G11_OutputFcn, ...
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


% --- Executes just before G11 is made visible.
function G11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to G11 (see VARARGIN)

% Choose default command line output for G11
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes G11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = G11_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double


% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vx0_Callback(hObject, eventdata, handles)
% hObject    handle to vx0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vx0 as text
%        str2double(get(hObject,'String')) returns contents of vx0 as a double


% --- Executes during object creation, after setting all properties.
function vx0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vx0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vy0_Callback(hObject, eventdata, handles)
% hObject    handle to vy0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vy0 as text
%        str2double(get(hObject,'String')) returns contents of vy0 as a double


% --- Executes during object creation, after setting all properties.
function vy0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vy0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ax_Callback(hObject, eventdata, handles)
% hObject    handle to ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ax as text
%        str2double(get(hObject,'String')) returns contents of ax as a double


% --- Executes during object creation, after setting all properties.
function ax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function delta_Callback(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of delta as text
%        str2double(get(hObject,'String')) returns contents of delta as a double


% --- Executes during object creation, after setting all properties.
function delta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plotd.
function plotd_Callback(hObject, eventdata, handles)
% hObject    handle to plotd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Tf=str2num(get(handles.time,'String'));
deltat=str2num(get(handles.delta,'String'));
vx01=str2num(get(handles.vx0,'String'));
vy01=str2num(get(handles.vy0,'String'));
ax1=str2num(get(handles.ax,'String'));
x01=0;y01=0;g=9.81; Nt=1000;ay=-g;
t=linspace(0,Tf,Nt);
x=zeros(1,Nt); 
y=zeros(1,Nt); 
x=zeros(1,Nt);
vy=zeros(1,Nt);
x(1)=x01; y(1)=y01;
vx(1)=vx01; vy(1)=vy01;
%      calculate the motion equation
for it=1:Nt-1
    vx(it+1)=vx(it)+ax1*deltat;
    vy(it+1)=vy(it)+ay*deltat;
    x(it+1)=x(it)+0.5*(vx(it+1)+vx(it))*deltat;
   y(it+1)=y(it)+0.5*(vy(it+1)+vy(it))*deltat; 
 if y(it+1)<0
       vy(it+1)=abs(vy(it+1));
   end
end
% plot motion
xmax=max(x);
xmin=min(x);
ymax=max(y);
ymin=min(y);
axis([xmin  1  ymin  ymax]);
for it=1:Nt
    plot(handles.axes1,x(it),y(it),'bo',...
         x(1:it),y(1:it),'r');    
    xlabel('x(m)');ylabel('y(m)');
    pause(.01)
    drawnow
end


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v=get(handles.pause,'Value')
if v==1
    pause(2)
end
