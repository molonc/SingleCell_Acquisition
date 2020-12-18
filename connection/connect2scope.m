function [hObject, eventdata, handles] = connect2scope(hObject, eventdata, handles)
handles.scopeConnection = actxserver('Nikon.TiScope.NikonTI');
end