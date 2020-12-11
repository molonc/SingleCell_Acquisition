stage = serial('COM4');
set(stage,...
    'baudrate', 115200,...
    'parity', 'none',...
    'databits', 8,...
    'stopbits', 1,...
    'requesttosend', 'off',...
    'dataterminalready', 'off',...
    'timeout', 1,...
    'outputbuffersize', 12800,...
    'inputbuffersize', 12800,...
    'bytesAvailableFcnMode', 'byte',...
    'bytesAvailableFcnCount', 3,...
    'terminator', 'CR',...
    'flowControl', 'none');
fopen(stage);
% here it appears to have used bytearray
% fwrite(stage, [char(255) char(66)]); % low level commands mode

% % get current stage position
% % X
% fwrite(stage, [char(24) char(97) char(3) char(58)]);
% xPosData = fread(stage, 3, 'char');
% if numel(xPosData)
%     currentPosition(1) = (xPosData(1) + 256 * xPosData(2) + 256 * 256 * xPosData(3)) / 10;
%     if currentPosition(1) > 2^23 / 10
%         currentPosition(1) = -2^24 / 10 + currentPosition(1);
%     end
% else
%     currentPosition(1) = nan;
%     warndlg('Cannot obtain stage position. Check your stage connection.');
% end
% 
% % Y
% fwrite(stage, [char(24) char(97) char(3) char(58)]);
% yPosData = fread(stage, 3, 'char');
% 
% if numel(yPosData)
%     currentPosition(2) = (yPosData(1) + 256 * yPosData(2) + 256 * 256 * yPosData(3)) / 10;
%     if currentPosition(2) > 2^23 / 10
%         currentPosition(2) = -2^24 / 10 + currentPosition(2);
%     end        
% else
%     currentPosition(2) = nan;
%     warndlg('Cannot obtain stage position. Check your stage connection.');
% end
% 
% disp(currentPosition);

% try moving absolutely
% clear input buffer
flushinput(stage);

move_cmd = double('MOVE X=100 Y=100\r');
fwrite(stage, move_cmd);

% if the above doesn't work, try this
% move_cmd = 'MOVE X=100 Y=100\r';
% fwrite(stage, move_cmd);

% if it still doesn't work, try adding '\r' manually

% check if stage has finished moving
check_cmd = double('RS X?');        % add \r if doesn't work
fwrite(stage, check_cmd);
stage                               % do this to check how many bytes are available
response = fread(stage, 3, 'char')  % decoding uses ascii characters



% % get current stage position
% % X
% fwrite(stage, [char(24) char(97) char(3) char(58)]);
% xPosData = fread(stage, 3, 'char');
% if numel(xPosData)
%     currentPosition(1) = (xPosData(1) + 256 * xPosData(2) + 256 * 256 * xPosData(3)) / 10;
%     if currentPosition(1) > 2^23 / 10
%         currentPosition(1) = -2^24 / 10 + currentPosition(1);
%     end
% else
%     currentPosition(1) = nan;
%     warndlg('Cannot obtain stage position. Check your stage connection.');
% end
% 
% % Y
% fwrite(stage, [char(24) char(97) char(3) char(58)]);
% yPosData = fread(stage, 3, 'char');
% 
% if numel(yPosData)
%     currentPosition(2) = (yPosData(1) + 256 * yPosData(2) + 256 * 256 * yPosData(3)) / 10;
%     if currentPosition(2) > 2^23 / 10
%         currentPosition(2) = -2^24 / 10 + currentPosition(2);
%     end        
% else
%     currentPosition(2) = nan;
%     warndlg('Cannot obtain stage position. Check your stage connection.');
% end
% 
% disp(currentPosition);

fclose(stage);
delete(stage);