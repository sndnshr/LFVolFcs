% TEST_RMSE_ALPHA_THETA is used to 
%
% 1. quantify the deviation of the frequency response of the sparse filter, 
% compared to the non-sparse filter by means of normalized mean root square
% error (NRMSE)
%
% 2. Calculate the number of non-zero coefficients of the sparse filter
% compared to that of non-sparse filter as a metric of reduction in
% computational complexity
%
% w.r.t different values of angle of rotation(alpha) and half-fan
% angle(theta)
%
% Usage:
%       test_rmse_alpha_theta
% 
% Inputs:
%       theta - Range of angular width of the bow-tie passband
%       alpha - Range of values for passband orientation xu and yv freq.
%       subspaces
%       hth - Threshold value for hard-thresholding
% 
% Outputs:
%       Excel sheet with NRMSE values and number of non-zero coefficients
%       vs. alpha theta
%       Plot of NRMSE vs. alpha and theta
%       Plot of number of non-zero coefficients vs. alpha and theta
%
% Author - Sanduni Premaratne
% Date - May 21, 2018
% Last modified - Jun 07, 2018

clear; close all
alpha = 45:10:135;             % angle of rotation
theta = 5:5:45;             % half-fan angle
hth = 0.01;                    % hard threshold

[X,Y] = ndgrid(alpha,theta);
Z1 = zeros(length(theta),length(hth));
Z2 = zeros(length(theta),length(hth));
RMSE = zeros(length(alpha)*length(hth),6);

row=1;
for i = 1:length(alpha)
    for j = 1:length(theta)
        RMSE(row,1) = alpha(i);
        RMSE(row,2) = theta(j);
        
        p = fanfildes(theta(j),alpha(i),hth);
        RMSE(row,3:6) = p; 
        Z1(i,j) = p(1);
        Z2(i,j) = p(4);
        row = row + 1;
    end
end

header = {'alpha','theta','RMSE_FR','RMSE_MR','RMSE_PR','non-zero coef %'};
xlswrite('RMSE_alpha_theta',header,'Sheet1');
xlswrite('RMSE_alpha_theta',RMSE,'Sheet1','A2');

% RMSE
surf(X,Y,Z1*100)
xlabel('\alpha, deg.')
ylabel('\theta, deg.')
zlabel('NRMSE, %')

% non-zero coef.
figure
surf(X,Y,Z2*100)
xlabel('\alpha, deg.')
ylabel('\theta, deg.')
zlabel('non-zero coefficients, %')
