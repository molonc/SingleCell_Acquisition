function [hObject, handles] = powerUV(hObject, handles)
UVPowerDec = str2double(get(handles.editUV, 'String'));
UVPowerHex = dec2hex(255-UVPowerDec, 2);
powerUV = sscanf(['53 18 03 01 F', UVPowerHex, '0 50'], '%2X');
fwrite(handles.laserConnection, powerUV, 'uint8');
guidata(hObject, handles);
end