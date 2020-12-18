function [hObject, eventdata, handles] = decZ(hObject, eventdata, handles)
handles.scopeConnection.ZDrive.MoveRelative(handles.ZstepSize);
guidata(hObject, handles);
end