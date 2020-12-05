function [hObject, eventdata, handles] = disconnLasers(hObject, eventdata, handles)
fclose(handles.laserConnection);
delete(handles.laserConnection);
% clear handles.laserConnection;
disp('Disconnected from lasers');
guidata(hObject, handles);
end