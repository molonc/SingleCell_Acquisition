function [hObject, eventdata, handles] = decZ(hObject, eventdata, handles)
try
    inputVal = (handles.ZstepSize/2.5)*100;         % conversion between machine input and actual step size
    handles.scopeConnection.ZDrive.MoveRelative(-inputVal);
    guidata(hObject, handles);
catch
    [hObject, eventdata, handles] = goToZ(hObject, eventdata, handles, 0);      % bottom of stage
    warndlg('Failed: The Z stage is already at the bottom.');
end
end