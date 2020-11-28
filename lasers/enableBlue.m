function [hObject, eventdata, handles] = enableBlue(hObject, eventdata, handles)
blueOnCmd = sscanf('4F 5F 50', '%2X');
fwrite(handles.laserConnection, blueOnCmd, 'uint8');
guidata(hObject, handles);
end