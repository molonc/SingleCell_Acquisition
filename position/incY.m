function [hObject, eventdata, handles] = incY(hObject, eventdata, handles)
fwrite(handles.stageConnection, [char(25) char(43) char(0) char(58)]);
guidata(hObject, handles);
end