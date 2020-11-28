function [hObject, eventdata, handles] = enableGreen(hObject, eventdata, handles)
greenOnCmd = sscanf('4F 7D 50', '%2X');
fwrite(handles.laserConnection, greenOnCmd, 'uint8');
guidata(hObject, handles);
end