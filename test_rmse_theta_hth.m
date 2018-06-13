% TEST_RMSE_THETA_HTH is used to 
%
% 1. quantify the deviation of the frequency response of the sparse filter, 
% compared to the non-sparse filter by means of normalized mean root square
% error (NRMSE)
%
% 2. Calculate the number of non-zero coefficients of the sparse filter
% compared to that of non-sparse filter as a metric of reduction in
% computational complexity
%
% w.r.t different values of half-fn angle(theta) and hard threshold(hth)
%
% Usage:
%       test_rmse_theta_hth
% 
% Inputs:
%       theta - Range of angular width of the bow-tie passband
%       alpha - Passband orientation xu and yv freq. subspaces
%       hth - Range of threshold values for hard-thresholding
% 
% Outputs:
%       Excel sheet with NRMSE values and number of non-zero coefficients
%       vs. theta hth
%       Plot of NRMSE vs. theta and hth
%       Plot of number of non-zero coefficients vs. theta and hth
%
% Author - Sanduni Premaratne
% Date - May 21, 2018
% Last modified - Jun 07, 2018

clear; close all
alpha = 50;                 % angle of rotation
theta = 5:5:30;             % half-fan angle
hth = 0.005:0.005:0.05;     % hard threshold

[X,Y] = ndgrid(theta,hth);
Z1 = zeros(length(theta),length(hth));
Z2 = zeros(length(theta),length(hth));
RMSE = zeros(length(theta)*length(hth),6);

row=1;
for i= 1:length(theta)
    for j=1:length(hth)
        RMSE(row,1) = theta(i);
        RMSE(row,2) = hth(j);
        
        p = fanfildes(theta(i),alpha,hth(j));
        RMSE(row,3:6) = p;
        Z1(i,j) = p(1);
        Z2(i,j) = p(4);
        row = row + 1;
    end
end

header = {'theta','hth','RMSE_FR','RMSE_MR','RMSE_PR','non-zero coef %'};
xlswrite('RMSE_theta_hth',header,'Sheet1');
xlswrite('RMSE_theta_hth',RMSE,'Sheet1','A2');

% RMSE
surf(X,Y,Z1*100)
xlabel('\theta, deg.')
ylabel('hth')
zlabel('NRMSE, %')
ylim([0.005 0.05]);

% non-zero coef.
figure
surf(X,Y,Z2*100)
xlabel('\theta, deg.')
ylabel('hth')
zlabel('non-zero coefficients, %')
ylim([0.005 0.05]);
