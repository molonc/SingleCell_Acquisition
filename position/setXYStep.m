function [hObject, eventdata, handles] = setXYStep(hObject, eventdata, handles, XYstepSize)
[hObject, eventdata, handles] = setXStep(hObject, eventdata, handles, XYstepSize);
[hObject, eventdata, handles] = setYStep(hObject, eventdata, handles, XYstepSize);
guidata(hObject, handles);
end