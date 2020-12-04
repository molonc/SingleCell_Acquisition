function [hObject, eventdata, handles] = getTemp(hObject, eventdata, handles)
tempCmd = sscanf('53 91 02 50', '%2X');
fwrite(handles.laserConnection, tempCmd, 'uint8');
tempData = fread(handles.laserConnection, 2, 'char');
first11MSB = tempData(1) * 8 + bitsra(tempData(2), 5);
handles.laserTemp = first11MSB * 0.125;
disp(['The temperature of the laser control box (oC): ', num2str(handles.laserTemp)]);
end