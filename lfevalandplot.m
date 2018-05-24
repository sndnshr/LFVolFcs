function ssimval=lfevalandplot

% LFEVALANDPLOT is used to evaluate the performance of the sparse filter using
% PSNR and SSIM and to plot figures of the volumetric focussed LFs.
%
% Inputs:
%       lfnm - Light field name
%       lfvf - Refocused image from conventional depth filter. Load from
%              directory.
%       lfvfh - Refocused image from hard thresholded depth
%               filter (sparse filter). Load from directory.
%
% Outputs:
%       SSIM and PSNR of lfvfh compared to lfvf.
%
% Author - Chamira Edussooriya
% Date - July 23, 2013
% Last modified - May 24, 2018

clc;
close all;

lfnm = 'Mirabelle_Prune_Tree';           % name of the LF
load([lfnm,'_VF.mat']);     % LF of conventional filter
load([lfnm,'_VFHT.mat']);   % LF of sparse filter

if max(lfvf(:))<256
    maxval = 255;
else
    maxval = 65535;
end
mse = mean((lfvfh(:)-lfvf(:)).^2);
psnr = 10*log10(maxval^2/mse);
[ssimval,~] = ssim(lfvfh,lfvf);

disp(['PSNR = ',num2str(psnr),' dB']);
disp(['SSIM = ',num2str(ssimval),' units']);

figure;
imshow(lfvf,[0,255]);  

figure;
imshow(lfvfh,[0,255]);   