function [hObject, eventdata, handles] = disconnScope(hObject, eventdata, handles)
try
    delete(handles.scopeConnection);
    guidata(hObject, handles);
catch
    warndlg('Scope was not connected.');
end
end