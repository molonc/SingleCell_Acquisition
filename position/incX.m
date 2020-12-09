function [hObject, eventdata, handles] = incX(hObject, eventdata, handles)
fwrite(handles.stageConnection, [char(24) char(43) char(0) char(58)]);
guidata(hObject, handles);
end