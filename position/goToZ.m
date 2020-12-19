function [hObject, eventdata, handles] = goToZ(hObject, eventdata, handles, target)
try
    inputVal = (target/2.5)*100;
    handles.scopeConnection.ZDrive.MoveAbsolute(inputVal);
    guidata(hObject, handles);
catch
    warndlg('Failed: Range is out of bound.')
end
end