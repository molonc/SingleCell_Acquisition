stage = serial('COM4');
set(stage,...
    'baudrate', 115200,...
    'parity', 'none',...
    'databits', 8,...
    'stopbits', 1,...
    'requesttosend', 'on',...
    'dataterminalready', 'on',...
    'timeout', 1,...
    'outputbuffersize', 512,...
    'inputbuffersize', 1024,...
    'bytesAvailableFcnMode', 'byte',...
    'bytesAvailableFcnCount', 3,...
    'terminator', '',...
    'flowControl', 'none');
fopen(stage);
fwrite(stage, [char(255) char(66)]); % low level commands mode

% get current stage position
% X
fwrite(stage, [char(24) char(97) char(3) char(58)]);
xPosData = fread(stage, 3, 'char');
if numel(xPosData)
    currentPosition(1) = (xPosData(1) + 256 * xPosData(2) + 256 * 256 * xPosData(3)) / 10;
    if currentPosition(1) > 2^23 / 10
        currentPosition(1) = -2^24 / 10 + currentPosition(1);
    end
else
    currentPosition(1) = nan;
    warndlg('Cannot obtain stage position. Check your stage connection.');
end

% Y
fwrite(stage, [char(24) char(97) char(3) char(58)]);
yPosData = fread(stage, 3, 'char');

if numel(yPosData)
    currentPosition(2) = (yPosData(1) + 256 * yPosData(2) + 256 * 256 * yPosData(3)) / 10;
    if currentPosition(2) > 2^23 / 10
        currentPosition(2) = -2^24 / 10 + currentPosition(2);
    end        
else
    currentPosition(2) = nan;
    warndlg('Cannot obtain stage position. Check your stage connection.');
end

disp(currentPosition);

% try moving absolutely
move_cmd = double('MOVE X=100 Y=100');
fwrite(stage, move_cmd);

% get current stage position
% X
fwrite(stage, [char(24) char(97) char(3) char(58)]);
xPosData = fread(stage, 3, 'char');
if numel(xPosData)
    currentPosition(1) = (xPosData(1) + 256 * xPosData(2) + 256 * 256 * xPosData(3)) / 10;
    if currentPosition(1) > 2^23 / 10
        currentPosition(1) = -2^24 / 10 + currentPosition(1);
    end
else
    currentPosition(1) = nan;
    warndlg('Cannot obtain stage position. Check your stage connection.');
end

% Y
fwrite(stage, [char(24) char(97) char(3) char(58)]);
yPosData = fread(stage, 3, 'char');

if numel(yPosData)
    currentPosition(2) = (yPosData(1) + 256 * yPosData(2) + 256 * 256 * yPosData(3)) / 10;
    if currentPosition(2) > 2^23 / 10
        currentPosition(2) = -2^24 / 10 + currentPosition(2);
    end        
else
    currentPosition(2) = nan;
    warndlg('Cannot obtain stage position. Check your stage connection.');
end

disp(currentPosition);

fclose(stage);
delete(stage);