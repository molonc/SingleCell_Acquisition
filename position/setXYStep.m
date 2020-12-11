function [hObject, eventdata, handles] = setXYStep(hObject, eventdata, handles, XYstepSize)
set(handles.stageStatus, 'String', ['Step: ', num2str(XYstepSize)], 'ForegroundColor', [0,0,1]);
guidata(hObject, handles);
[hObject, eventdata, handles] = setXStep(hObject, eventdata, handles, XYstepSize);
[hObject, eventdata, handles] = setYStep(hObject, eventdata, handles, XYstepSize);
guidata(hObject, handles);
end