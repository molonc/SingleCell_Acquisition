function [hObject, eventdata, handles] = enableTeal(hObject, eventdata, handles)
tealOnCmd = sscanf('4F 3F 50', '%2X');
fwrite(handles.laserConnection, tealOnCmd, 'uint8');
guidata(hObject, handles);
end