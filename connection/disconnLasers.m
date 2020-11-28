function [hObject, eventdata, handles] = disconnLasers(hObject, eventdata, handles)
try
    fclose(handles.laserConnection);
    delete(handles.laserConnection);
    disp('Disconnected from lasers');
    guidata(hObject, handles);
catch
    warndlg('Lasers were not connected.');
end
end