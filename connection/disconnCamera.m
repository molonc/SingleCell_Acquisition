function [hObject, eventdata, handles] = disconnCamera(hObject, eventdata, handles)
try
    stop(handles.cameraConnection);
    delete(handles.cameraConnection);
    disp('Disconnected from camera');
    guidata(hObject, handles);
catch
    warndlg('Camera was not connected.');
end
end