function [hObject, eventdata, handles] = decX(hObject, eventdata, handles)
fwrite(handles.stageConnection, [char(24) char(45) char(0) char(58)]);
guidata(hObject, handles);
end