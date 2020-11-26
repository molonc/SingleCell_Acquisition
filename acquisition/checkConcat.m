function selected = checkConcat(hObject, eventdata, handles)
selected = handles.selected;
if get(handles.concatUV, 'Value') == 1
    if get(handles.toggleUV, 'Value') == 1
        selected(end+1) = 1;
    else
        warndlg('Failed: The UV laser is not turned on.');
        set(handles.concatUV, 'Value', 0);
    end
end
if get(handles.concatBlue, 'Value') == 1
    if get(handles.toggleBlue, 'Value') == 1
        selected(end+1) = 2;
    else
        warndlg('Failed: The Blue laser is not turned on.');
        set(handles.concatBlue, 'Value', 0);
    end
end
if get(handles.concatCyan, 'Value') == 1
    if get(handles.toggleCyan, 'Value') == 1
        selected(end+1) = 3;
    else
        warndlg('Failed: The Cyan laser is not turned on.');
        set(handles.concatCyan, 'Value', 0);
    end
end
if get(handles.concatTeal, 'Value') == 1
    if get(handles.toggleTeal, 'Value') == 1
        selected(end+1) = 4;
    else
        warndlg('Failed: The Teal laser is not turned on.');
        set(handles.concatTeal, 'Value', 0);
    end
end
if get(handles.concatGreen, 'Value') == 1
    if get(handles.toggleGreen, 'Value') == 1
        selected(end+1) = 5;
    else
        warndlg('Failed: The Green laser is not turned on.');
        set(handles.concatGreen, 'Value', 0);
    end
end
if get(handles.concatRed, 'Value') == 1
    if get(handles.toggleRed, 'Value') == 1
        selected(end+1) = 6;
    else
        warndlg('Failed: The Red laser is not turned on.');
        set(handles.concatRed, 'Value', 0);
    end
end
end