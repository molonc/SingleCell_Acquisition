function [hObject, eventdata, handles] = incZ(hObject, eventdata, handles)
try
    inputVal = (handles.ZstepSize/2.5)*100;         % conversion between machine input and actual step size
    handles.scopeConnection.ZDrive.MoveRelative(inputVal);
    guidata(hObject, handles);
catch
    warndlg('Failed: The Z stage is already at the top.');
end
end