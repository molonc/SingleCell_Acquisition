function [hObject, eventdata, handles] = acquire(hObject, eventdata, handles)
handles.selected = [];
handles.selected = checkConcat(hObject, eventdata, handles);
    function goToTile(row, col)
       disp(['going to tile', num2str(row), ' ', num2str(col)]);
       % do things here. remember to check for the state within here as
       % well
       pause(0.02);
       disp('finished capturing');
    end
ii = handles.curRow;
jj = handles.curCol;
for i = ii:handles.chipRow/handles.imgRow
    for j = jj:handles.chipCol/handles.imgCol
        if (get(handles.pauseORresume, 'Value') == 0)
            handles.paused = false;
            goToTile(i, j);
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
%     handles.curRow
end

if handles.paused
    disp('paused');
else
    handles.finished = true;
    set(handles.status, 'String', 'Acquisition completed');
    handles
end
guidata(hObject, handles);
end