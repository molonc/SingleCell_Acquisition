function [hObject, handles] = calcPos(hObject, handles)
topLeft = handles.first;
topLeftX = topLeft(1);
topLeftY = topLeft(2);
topLeftZ = topLeft(3);

topRight = handles.second;
topRightX = topRight(1);
topRightY = topRight(2);
topRightZ = topRight(3);

bottomLeft = handles.third;
bottomLeftX = bottomLeft(1);
bottomLeftY = bottomLeft(2);
bottomLeftZ = bottomLeft(3);

chipRow = handles.chipRow;
chipCol = handles.chipCol;
imgRow = handles.imgRow;
imgCol = handles.imgCol;
row = chipRow/imgRow;
col = chipCol/imgCol;

% % use 3D geometry to calculate the coordinates of the bottom right corner
% not necessary
% bottomRightX = topRightX + bottomLeftX - topLeftX;
% bottomRightY = topRightY + bottomLeftY - topLeftY;
% bottomRightZ = topRightZ + bottomLeftZ - topLeftZ;

% calculate the deltas
xJump = (topRightX - topLeftX)/(col-1);     % positive
xAdjustInY = (bottomLeftX - topLeftX)/(row-1);

yJump = (bottomLeftY - topLeftY)/(row-1);   % negative
yAdjustInX = (topRightY - topLeftY)/(col-1);

zAdjustInX = (topRightZ - topLeftZ)/(col-1);
zAdjustInY = (bottomLeftZ - topLeftZ)/(row-1);

% X,Y,Z = positions of X,Y,Z of each cell in the chip
X = zeros(row, col);
Y = zeros(row, col);
Z = zeros(row, col);

% TODO: verify - haven't been tested
for y = 1:row
    for x = 1:col
        X(y,x) = topLeftX + (xJump)*(x-1) + xAdjustInY*(y-1);
        Y(y,x) = topLeftY + (yJump)*(y-1) + yAdjustInX*(x-1);
        Z(y,x) = topLeftZ + (zAdjustInX)*(x-1) + (zAdjustInY)*(y-1);
    end
end

handles.X = X;
handles.Y = Y;
handles.Z = Z;
guidata(hObject, handles);
end