function [hObject, eventdata, handles, capture] = acquireView(hObject, eventdata, handles)
warning('off','images:initSize:adjustingMag');      % suppress image size warning messages
try
    capture = getsnapshot(handles.cameraConnection);          % continuously acquire images
catch
    disp('Camera is not running');
    stop(handles.cameraConnection);
end
end