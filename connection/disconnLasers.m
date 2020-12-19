function [hObject, eventdata, handles] = disconnLasers(hObject, eventdata, handles)
fclose(handles.laserConnection);
delete(handles.laserConnection);
disp('Disconnected from lasers');
guidata(hObject, handles);
end