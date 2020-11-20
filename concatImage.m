function [hObject, eventdata, handles] = concatImage(hObject, eventdata, handles)
    function concatLaser(laser)
        lasers = {'UV', 'Blue', 'Cyan', 'Teal', 'Green', 'Red'};
        disp(['Concatenating laser ', char(lasers(laser))]);
    end

for i = 1:length(handles.selected)
    concatLaser(handles.selected(i));
end
end