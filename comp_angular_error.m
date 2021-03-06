function [ae] = comp_angular_error( in_ill, gt_ill)
%% Angular error function
% This function computes the angular error
% *Input:
%   -in_ill: Nx3 estimated illuminant vectors
%   -gt_ill: Nx3 ground-truth illuminant vectors
% *Output:
%   -ae: Nx1 angular errors
%
% Copyright (c) 2019 Mahmoud Afifi, Abhijith Punnappurath, 
% Graham Finlayson, and  Michael S. Brown
% EECS, York University, Canada
% School of Computing Sciences, The University of East Anglia, UK
%
% Permission is hereby granted, free of charge, to any person obtaining
% a copy of this software and associated documentation files (the
% "Software"), to deal in the Software with restriction for its use for
% research purpose only, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included
% in all copies or substantial portions of the Software.
%
% The Software is provided "as is", without warranty of any kind.
%
% Please cite the following work if this program is used:
% Mahmoud Afifi, Abhijith Punnappurath, Graham Finlayson, and
% Michael S. Brown, As-projective-as-possible bias correction for
% illumination estimation algorithms, Journal of the Optical Society of
% America A (JOSA A), Vol. 36, No. 1, pp. 71-78, 2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

in_ill_norm = sqrt(sum(in_ill.^2,2));
gt_ill_norm = sqrt(sum(gt_ill.^2,2));
%angular error
angles=dot(repmat(in_ill,size(gt_ill,1),1),gt_ill,2)./(repmat(in_ill_norm,size(gt_ill,1),1).*gt_ill_norm);
angles(angles>1)=1;
ae=acosd(angles);
ae(isnan(ae))=0;
