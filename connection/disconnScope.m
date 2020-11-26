function [hObject, eventdata, handles] = disconnScope(hObject, eventdata, handles)
disp('Disconnect scope function here');
guidata(hObject, handles);
end