function [hObject, eventdata, handles] = setYStep(hObject, eventdata, handles, stepSize)
fwrite(handles.stageConnection, [char(25) char(68) char(3) char(mod(stepSize * 10, 256)) char(round(mod(stepSize * 10 / 256, 256))) char(round(mod(stepSize * 10 / 256 / 256, 256))) char(58)]);
guidata(hObject, handles);
end