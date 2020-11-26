function [hObject, eventdata, handles] = connect2scope(hObject, eventdata, handles)
disp('scope connection function here');
guidata(hObject, handles);
end