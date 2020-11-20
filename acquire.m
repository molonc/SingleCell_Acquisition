function [hObject, eventdata, handles] = acquire(hObject, eventdata, handles)
    function goToTile(row, col)
       disp(['going to tile row ', num2str(row), ' col ', num2str(col)]);
       % do things here. remember to check for the state within here as
       % well
       pause(0.5);
    end

    function turnOnLaser(laser)
        lasers = {'UV', 'Blue', 'Cyan', 'Teal', 'Green', 'Red'};
        disp(['Turning on laser ', char(lasers(laser))]);
        pause(0.5);
    end

    function takeNsaveImage()
        disp('Taking image');
        pause(0.5);
        disp(['Saving image at ', handles.outputDir]);
        pause(0.5);
    end

    function acquireTile(row, col)
        goToTile(row, col);
        takeNsaveImage();
    end

handles.selected = [];
handles.selected = checkConcat(hObject, eventdata, handles);
guidata(hObject, handles);
turnOnLaser(handles.curLaser);
ii = handles.curRow;
jj = handles.curCol;
% for i = ii:handles.chipRow/handles.imgRow
%     for j = jj:handles.chipCol/handles.imgCol
for i = ii:3
    for j = jj:3
        if (get(handles.pauseORresume, 'Value') == 0)
            handles.paused = false;
            acquireTile(i, j);
            handles.curCol = handles.curCol + 1;
        else
            handles.paused = true;
            break;
        end
    end
    guidata(hObject, handles);
    if handles.paused
        break;
    else
        handles.curRow = handles.curRow + 1;
        handles.curCol = 1;
        jj = 1;
    end
    guidata(hObject, handles);
end

if handles.paused
    set(handles.status, 'String', 'Paused', 'ForegroundColor', [0, 0, 1]);
    set(handles.pauseORresume, 'String', 'Resume', 'enable',' on');
    set(handles.Quit, 'enable', 'on');
    disp('paused');
    waitfor(handles.pauseORresume, 'Value', 0);
else
    handles.curRow = 1;
    handles.curCol = 1;
end
guidata(hObject, handles);
end