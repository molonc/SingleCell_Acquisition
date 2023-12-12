function [app] = connect2lasers(app)
    laser_serial = serialport(getConfig('LASER_PORT'), 9600);
    laser_serial.DataBits = 8;
    laser_serial.Parity = 'none';
    laser_serial.StopBits = 1;
    laser_serial.configureCallback('byte', 2, connect_lasers_callback(laser_serial))
    laser_serial.FlowControl = 'none';
    configureTerminator(laser_serial, 13);
    app.laser = laser_serial;

    initCmd1 = sscanf('57 02 FF 50', '%2X');
    initCmd2 = sscanf('57 03 AB 50', '%2X');
    writeline(app.laser, initCmd1, 'uint8');
    writeline(app.laser, initCmd2, 'uint8');

function connect_lasers_callback(src)
    data = fread(src, src.BytesAvailable);
    disp(['Received data: ' char(data)])

    
