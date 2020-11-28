function [hObject, handles] = powerCyan(hObject, handles)
cyanPowerDec = str2double(get(handles.editCyan, 'String'));
cyanPowerHex = dec2hex(255-cyanPowerDec, 2);
powerCyanCmd = sscanf(['53 18 03 02 F', cyanPowerHex, '0 50'], '%2X');
fwrite(handles.laserConnection, powerCyanCmd, 'uint8');
guidata(hObject, handles);
end