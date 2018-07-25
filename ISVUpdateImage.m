function ISVUpdateImage(obj,varargin)
% Helper function for imageSetViewer
% Brett Shoelson, PhD
% brett.shoelson@mathworks.com
% Copyright The MathWorks, Inc. 2015
allStrings = get(obj,'String');
imgAx = varargin{2};
currImgName = allStrings{get(obj,'Value')};
currImg = imread(currImgName);
imshow(currImg,'parent',imgAx);
title(currImgName,'fontsize',7,'interpreter','none')
expandAxes(imgAx)