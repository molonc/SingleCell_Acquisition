function [hObject, eventdata, handles] = decY(hObject, eventdata, handles)
fwrite(handles.stageConnection, [char(25) char(45) char(0) char(58)]);
guidata(hObject, handles);
end