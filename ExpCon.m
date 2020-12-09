function varargout = ExpCon(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ExpCon_OpeningFcn, ...
                   'gui_OutputFcn',  @ExpCon_OutputFcn, ...
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
end


% --- Executes just before ExpCon is made visible.
function ExpCon_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
handles.expTime = varargin{1};
handles.binning = varargin{2};
handles.gain = varargin{3};
handles.flatfield = varargin{4};
handles.sigma = varargin{5};

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ExpCon wait for user response (see UIRESUME)
uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = ExpCon_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;
varargout{1} = handles.expTime;
varargout{2} = handles.binning;
varargout{3} = handles.gain;
varargout{4} = handles.flatfield;
varargout{5} = handles.sigma;
delete(handles.figure1);
end


function expTimeEdit_Callback(hObject, eventdata, handles)
% hObject    handle to expTimeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of expTimeEdit as text
%        str2double(get(hObject,'String')) returns contents of expTimeEdit as a double
handles.expTime = str2double(get(hObject, 'String'));
guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function expTimeEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to expTimeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on selection change in binList.
function binList_Callback(hObject, eventdata, handles)
% hObject    handle to binList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns binList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from binList
handles.binning = get(hObject, 'String');
guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function binList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to binList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function gainEdit_Callback(hObject, eventdata, handles)
% hObject    handle to gainEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gainEdit as text
%        str2double(get(hObject,'String')) returns contents of gainEdit as a double
handles.gain = str2double(get(hObject, 'String'));
guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function gainEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gainEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.expTime = str2double(get(handles.expTimeEdit, 'String'));
handles.binning = get(handles.binList, 'String');
handles.gain = str2double(get(handles.gainEdit, 'String'));
handles.flatfield = get(handles.flatfieldCheck, 'Value');
handles.sigma = str2double(get(handles.sigmaEdit, 'String'));
guidata(hObject, handles);
end


% --- Executes on button press in flatfieldCheck.
function flatfieldCheck_Callback(hObject, eventdata, handles)
% hObject    handle to flatfieldCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of flatfieldCheck
if get(hObject, 'Value') == 1
    handles.flatfield = true;
    set(handles.sigmaEdit, 'visible', 'on');
    set(handles.text6, 'visible', 'on');
else
    handles.flatfield = false;
    set(handles.sigmaEdit, 'visible', 'off');
    set(handles.text6, 'visible', 'off');
end
guidata(hObject, handles);
end


function sigmaEdit_Callback(hObject, eventdata, handles)
% hObject    handle to sigmaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmaEdit as text
%        str2double(get(hObject,'String')) returns contents of sigmaEdit as a double
prev = handles.sigma;
sigma = str2double(get(hObject, 'String'));
if isnan(sigma) || floor(sigma) ~= sigma || sigma < 0
    set(hObject, 'String', num2str(prev));
    warndlg('Sigma must be a non-negative integer.');
else
    handles.sigma = sigma;
end
guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function sigmaEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
if isequal(get(hObject, 'waitstatus'), 'waiting')
    uiresume(hObject);
else
    delete(hObject);
end
end
