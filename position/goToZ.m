function [hObject, eventdata, handles] = goToZ(hObject, eventdata, handles, target)
handles.scopeConnection.ZDrive.MoveAbsolute(target);
guidata(hObject, handles);
end