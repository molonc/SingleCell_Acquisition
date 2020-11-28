function [hObject, eventdata, handles] = disableAll(hObject, eventdata, handles)
allOffCmd = sscanf('4F 7F 50', '%2X');
fwrite(handles.laserConnection, allOffCmd, 'uint8');
guidata(hObject, handles);
end