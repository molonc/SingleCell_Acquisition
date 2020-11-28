function [hObject, handles] = powerBlue(hObject, handles)
bluePowerDec = str2double(get(handles.editBlue, 'String'));
bluePowerHex = dec2hex(255-bluePowerDec, 2);
powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
fwrite(handles.laserConnection, powerBlue, 'uint8');
guidata(hObject, handles);
end