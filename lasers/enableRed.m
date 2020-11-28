function [hObject, eventdata, handles] = enableRed(hObject, eventdata, handles)
redOnCmd = sscanf('4F 7E 50', '%2X');
fwrite(handles.laserConnection, redOnCmd, 'uint8');
guidata(hObject, handles);
end