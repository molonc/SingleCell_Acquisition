function [hObject, eventdata, handles] = disconnStage(hObject, eventdata, handles)
try
    fclose(handles.stageConnection);
    delete(handles.stageConnection);
    disp('Disconnected from stage');
    guidata(hObject, handles);
catch
    warndlg('Stage was not connected.');
end
end