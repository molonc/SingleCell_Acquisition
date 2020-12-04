function [hObject, eventdata, handles] = connect2camera(hObject, eventdata, handles)
handles.cameraConnection = videoinput('pointgrey', 1, 'F7_Mono16_1920x1200_Mode0');
end
