function [hObject, eventdata, handles] = updatePos(hObject, eventdata, handles)
% get pos here %
set(handles.stageXtext, 'String', num2str(round(handles.stageX, 2)));
set(handles.stageYtext, 'String', num2str(round(handles.stageY, 2)));
set(handles.stageZtext, 'String', num2str(round(handles.stageZ, 2)));
guidata(hObject, handles);
end