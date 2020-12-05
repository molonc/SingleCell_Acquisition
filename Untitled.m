laser = serial('COM5');
set(laser,...
    'baudrate', 9600,...
    'parity', 'none',...
    'databits', 8,...
    'stopbits', 1,...
    'terminator', 13,...
    'bytesAvailableFcnMode', 'byte',...
    'bytesAvailableFcnCount', 2,...
    'flowControl', 'none');
fopen(laser);

initCmd1 = sscanf('57 02 FF 50', '%2X');
initCmd2 = sscanf('57 03 AB 50', '%2X');
fwrite(laser, initCmd1, 'uint8');
fwrite(laser, initCmd2, 'uint8');

% get temp
tempCmd = sscanf('53 91 02 50', '%2X');
fwrite(laser, tempCmd, 'uint8');
tempData = fread(laser, 2, 'char');
first11MSB = tempData(1) * 8 + bitsra(tempData(2), 5);
temperature = first11MSB * 0.125;
disp(['The temperature of the laser control box (oC): ', num2str(temperature)]);

% enables UV
UVOnCmd = sscanf('4F 77 50', '%2X');
fwrite(laser, UVOnCmd, 'uint8');

UVPowerDec = 50;
UVPowerHex = dec2hex(255-UVPowerDec, 2);
powerUV = sscanf(['53 18 03 01 F', UVPowerHex, '0 50'], '%2X');
fwrite(laser, powerUV, 'uint8');

% enables blue
blueOnCmd = sscanf('4F 5F 50', '%2X');
fwrite(laser, blueOnCmd, 'uint8');

bluePowerDec = 50;
bluePowerHex = dec2hex(255-bluePowerDec, 2);
powerBlue = sscanf(['53 1A 03 01 F', bluePowerHex, '0 50'], '%2X');
fwrite(laser, powerBlue, 'uint8');

% enables cyan
cyanOnCmd = sscanf('4F 7B 50', '%2X');
fwrite(laser, cyanOnCmd, 'uint8');

cyanPowerDec = 100;
cyanPowerHex = dec2hex(255-cyanPowerDec, 2);
powerCyanCmd = sscanf(['53 18 03 02 F', cyanPowerHex, '0 50'], '%2X');
fwrite(laser, powerCyanCmd, 'uint8');

% enables teal
tealOnCmd = sscanf('4F 3F 50', '%2X');
fwrite(laser, tealOnCmd, 'uint8');

tealPowerDec = 50;
tealPowerHex = dec2hex(255-tealPowerDec, 2);
powerTealCmd = sscanf(['53 1A 03 02 F', tealPowerHex, '0 50'], '%2X');
fwrite(laser, powerTealCmd, 'uint8');

% enables green
greenOnCmd = sscanf('4F 7D 50', '%2X');
fwrite(laser, greenOnCmd, 'uint8');

greenPowerDec = 10;
greenPowerHex = dec2hex(255-greenPowerDec, 2);
powerGreenCmd = sscanf(['53 18 03 04 F', greenPowerHex, '0 50'], '%2X');
fwrite(laser, powerGreenCmd, 'uint8');

% enables red
redOnCmd = sscanf('4F 7E 50', '%2X');
fwrite(laser, redOnCmd, 'uint8');

redPowerDec = 10;
redPowerHex = dec2hex(255-redPowerDec, 2);
powerRedCmd = sscanf(['53 18 03 08 F', redPowerHex, '0 50'], '%2X');
fwrite(laser, powerRedCmd, 'uint8');

% disables all
allOffCmd = sscanf('4F 7F 50', '%2X');
fwrite(laser, allOffCmd, 'uint8');