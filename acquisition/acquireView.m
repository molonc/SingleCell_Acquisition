function [hObject, eventdata, handles, capture] = acquireView(hObject, eventdata, handles)
warning('off','images:initSize:adjustingMag');      % suppress image size warning messages
try
    capture = getsnapshot(handles.cameraConnection);          % continuously acquire images
    % uncomment the part below if using MATLAB 2018b or newer
%     if handles.flatfield == true
%         capture = imflatfield(capture, handles.sigma);
%     end
catch
    disp('Camera is not running');
    stop(handles.cameraConnection);
end
end