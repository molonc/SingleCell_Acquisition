function [hObject, handles] = powerRed(hObject, handles)
redPowerDec = str2double(get(handles.editRed, 'String'));
redPowerHex = dec2hex(255-redPowerDec, 2);
powerRedCmd = sscanf(['53 18 03 08 F', redPowerHex, '0 50'], '%2X');
fwrite(handles.laserConnection, powerRedCmd, 'uint8');
guidata(hObject, handles);
end