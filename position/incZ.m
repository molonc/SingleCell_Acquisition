function [hObject, eventdata, handles] = incZ(hObject, eventdata, handles)
handles.scopeConnection.ZDrive.MoveRelative(-handles.ZstepSize);
guidata(hObject, handles);
end