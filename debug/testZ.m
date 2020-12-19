nikon = actxserver('Nikon.TiScope.NikonTI');
nikon.ZDrive.MoveAbsolute(100);
nikon.ZDrive.MoveAbsolute(100);
% MoveAbsolute(100) makes 2.5um actual movement
get(nikon.ZDrive.Position, 'DisplayString')