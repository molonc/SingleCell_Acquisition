function [hObject, handles] = powerTeal(hObject, handles)
tealPowerDec = str2double(get(handles.editTeal, 'String'));
tealPowerHex = dec2hex(255-tealPowerDec, 2);
powerTealCmd = sscanf(['53 1A 03 02 F', tealPowerHex, '0 50'], '%2X');
fwrite(handles.laserConnection, powerTealCmd, 'uint8');
guidata(hObject, handles);
end