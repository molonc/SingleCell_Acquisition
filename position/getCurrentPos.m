function [hObject, eventdata, handles] = getCurrentPos(hObject, eventdata, handles)
% X
fwrite(handles.stageConnection, [char(24) char(97) char(3) char(58)]);
xPosData = fread(handles.stageConnection, 3, 'char');
if numel(xPosData)
    currentPosition(1) = (xPosData(1) + 256 * xPosData(2) + 256 * 256 * xPosData(3)) / 10;
    if currentPosition(1) > 2^23 / 10
        currentPosition(1) = -2^24 / 10 + currentPosition(1);
    end
else
    currentPosition(1) = nan;
    warndlg('Cannot obtain stage position. Check your stage connection.');
end

% Y
fwrite(handles.stageConnection, [char(25) char(97) char(3) char(58)]);
yPosData = fread(handles.stageConnection, 3, 'char');
if numel(yPosData)
    currentPosition(2) = (yPosData(1) + 256 * yPosData(2) + 256 * 256 * yPosData(3)) / 10;
    if currentPosition(2) > 2^23 / 10
        currentPosition(2) = -2^24 / 10 + currentPosition(2);
    end        
else
    currentPosition(2) = nan;
    warndlg('Cannot obtain stage position. Check your stage connection.');
end

% Z
% this is actually done by the microscope
[hObject, eventdata, handles] = getCurrentZ(hObject, eventdata, handles);

handles.stageX = currentPosition(1);
handles.stageY = currentPosition(2);
% handles.stageZ = currentPosition(3);
guidata(hObject, handles);
end