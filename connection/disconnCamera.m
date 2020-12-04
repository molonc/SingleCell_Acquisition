function [hObject, eventdata, handles] = disconnCamera(hObject, eventdata, handles)
try
    delete(handles.cameraConnection);
    disp('Disconnected from camera');
    guidata(hObject, handles);
catch
    warndlg('Camera was not connected.');
end
end