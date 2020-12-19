function [hObject, eventdata, handles] = getCurrentZ(hObject, eventdata, handles)
posStr = get(handles.scopeConnection.ZDrive.Position, 'DisplayString');
posCell = str2double(strsplit(posStr, ' um'));
zPos = posCell(1);
handles.stageZ = zPos;
guidata(hObject, handles);
end