% PERF_THETA_HTH is used to compare performance of sparse filter vs. that of
% non-sparse filter in terms of SSIM, w.r.t. different values of half-fan
% angle (theta) and hard-thresholding threshold (hth).
%  
% Usage:
%       perf_theta_hth
% 
% Inputs:
%       alpha - Passband orientation xu and yv frequency subspaces
%       theta - Range of angular widths of the bow-tie passband
%       hth - Range of threshold values for hard-thresholding
% 
% Outputs:
%       Excel sheet with SSIM values vs. theta and hth
%       Plot of SSIM vs. theta and hth
%
% Author - Sanduni Premaratne
% Date - May 21, 2018
% Last modified - Jun 07, 2018

clear; close all
alpha = 50;                 % angle of rotation
theta = 5:5:30;             % half-fan angle
hth = 0.005:0.005:0.05;     % hard threshold

[X,Y] = ndgrid(theta,hth);
Z = zeros(length(theta),length(hth));

SSIM = zeros(length(theta)*length(hth),3);

row=1;
for i= 1:length(theta)
    for j=1:length(hth)
        SSIM(row,1) = theta(i);
        SSIM(row,2) = hth(j);
        
        % Derive the sparse and non-sparse filters for given theta,alpha
        % and hth
        p = fanfildes(theta(i),alpha,hth(j));
        
        % Refocusing with both sparse and non-sparse filters
        volrefocus; 
        
        % SSIM of sparse filter output compared to output of non-sparse
        % filter
        SSIM(row,3) = lfevalandplot;
        Z(i,j) = SSIM(row,3);
        
        row = row + 1;
    end
end

% Write to excel file
header = {'theta','hth','SSIM'};
xlswrite('SSIM_theta_hth',header,'Sheet1');
xlswrite('SSIM_theta_hth',SSIM,'Sheet1','A2');

% Plot against theta and hth
surf(X,Y,Z)
xlabel('\theta, deg.')
ylabel('hth')
zlabel('SSIM')
ylim([0.005 0.05]);