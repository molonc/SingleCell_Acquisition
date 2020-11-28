function [hObject, eventdata, handles] = enableUV(hObject, eventdata, handles)
UVOnCmd = sscanf('4F 77 50', '%2X');
fwrite(handles.laserConnection, UVOnCmd, 'uint8');
guidata(hObject, handles);
end