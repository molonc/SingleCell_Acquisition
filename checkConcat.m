function selected = checkConcat(hObject, eventdata, handles)
selected = handles.selected;
if get(handles.concatUV, 'Value') == 1
    selected(end+1) = 1;
end
if get(handles.concatBlue, 'Value') == 1
    selected(end+1) = 2;
end
if get(handles.concatCyan, 'Value') == 1
    selected(end+1) = 3;
end
if get(handles.concatTeal, 'Value') == 1
   selected(end+1) = 4;
end
if get(handles.concatGreen, 'Value') == 1
    selected(end+1) = 5;
end
if get(handles.concatRed, 'Value') == 1
    selected(end+1) = 6;
end
end