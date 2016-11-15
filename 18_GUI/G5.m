function varargout = G5(varargin)
% G5 MATLAB code for G5.fig
%      G5, by itself, creates a new G5 or raises the existing
%      singleton*.
%
%      H = G5 returns the handle to a new G5 or the handle to
%      the existing singleton*.
%
%      G5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in G5.M with the given input arguments.
%
%      G5('Property','Value',...) creates a new G5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before G5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to G5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help G5

% Last Modified by GUIDE v2.5 12-Nov-2015 01:19:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @G5_OpeningFcn, ...
                   'gui_OutputFcn',  @G5_OutputFcn, ...
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


% --- Executes just before G5 is made visible.
function G5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to G5 (see VARARGIN)

% Choose default command line output for G5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%hhhhhhhhh
% evalin('base','clear all');
% evalin('base','clc');
% listString=get(handles.listbox2,'String');
% assignin('base','listString',listString);
%hhhhhhhhh
% UIWAIT makes G5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = G5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2

%fffffff
% listValue=get(handles.listbox2,'Value');
% assignin('base','listValue',listValue);
% listString=evalin('base','listString');
% set(handles.text1,'String',listString(listValue));
% listValue=get(handles.listbox2,'Value');
% listString=get(handles.listbox2,'String');
% set(handles.text1,'String',listString(listValue));



% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cont=(get(handles.listbox2,'Value'));
a1=str2num(get(handles.a,'String'));
b1=str2num(get(handles.b,'String'));

switch cont
    case 1        
        c=a1+b1;
        set(handles.text3,'String',num2str(c));
        
    case 2
        c=a1-b1;
        set(handles.text3,'String',num2str(c));
    case 3
       c=a1/ b1;
        set(handles.text3,'String',num2str(c));  
    case 4
        c=a1*b1;
        set(handles.text3,'String',num2str(c));
    case 5
        c=mod(a1,b1);
        set(handles.text3, 'String',num2str(c));
    case 6
        pp=imread('aa.jpg');
        imshow(pp);
end

        

guidata(hObject, handles)



function a_Callback(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a as text
%        str2double(get(hObject,'String')) returns contents of a as a double


% --- Executes during object creation, after setting all properties.
function a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
