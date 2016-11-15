function varargout = G7(varargin)
% G7 MATLAB code for G7.fig
%      G7, by itself, creates a new G7 or raises the existing
%      singleton*.
%
%      H = G7 returns the handle to a new G7 or the handle to
%      the existing singleton*.
%
%      G7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in G7.M with the given input arguments.
%
%      G7('Property','Value',...) creates a new G7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before G7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to G7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help G7

% Last Modified by GUIDE v2.5 15-Nov-2015 23:34:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @G7_OpeningFcn, ...
                   'gui_OutputFcn',  @G7_OutputFcn, ...
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


% --- Executes just before G7 is made visible.
function G7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to G7 (see VARARGIN)

% Choose default command line output for G7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes G7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = G7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
bla=get(handles.panlsos,'SelectedObject')
aa=get(bla,'String')

pick=get(handles.chkpickles,'Value')
rel=get(handles.chkrelish,'Value')
crack=get(handles.crack,'Value')






% --- Executes on button press in chkccc.
function chkccc_Callback(hObject, eventdata, handles)
% hObject    handle to chkccc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkccc


% --- Executes on button press in chkpickles.
function chkpickles_Callback(hObject, eventdata, handles)
% hObject    handle to chkpickles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkpickles


% --- Executes on button press in chkrelish.
function chkrelish_Callback(hObject, eventdata, handles)
% hObject    handle to chkrelish (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkrelish


% --- Executes on button press in crack.
function crack_Callback(hObject, eventdata, handles)
% hObject    handle to crack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of crack


% --- Executes when selected object is changed in panlsos.
function panlsos_SelectionChangeFcn(hObject, eventdata, handles)

bla=get(handles.panlsos,'SelectedObject')
aa=get(bla,'String')
switch aa
    case 'sand'
        msgbox('check relish')
        set(handles.crack,'Enable','off')
        set(handles.crack,'Value',1)
        
        set(handles.chkrelish,'Enable','on')
        set(handles.chkrelish,'Value',1)
    case'soup'
        
        msgbox('check cracker')
        set(handles.chkrelish,'Enable','off')
        set(handles.chkrelish,'Value',0)
         set(handles.crack,'Enable','on')
        set(handles.crack,'Value',1)
end
% 


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
data1=get(hObject,'data')
display(sum(data1))
