function out=fanfildes(theta,alpha,hth)

% FANFILDES is used to design the 2D FIR fan filters required for
% volumetric focusing. Hardthreshoding is employed to reduce the 
% computational complexity of fan filetrs. Furthermore, the magnitude 
% responses of fan filters are plotted.
% Output impulse responses are saved in .mat format.
%
% Usage:
%       fanfildes(theta,alpha,hth)
% 
% Inputs:
%       theta - Half fan angle: determines angular width of the bow-tie
%       passband
%       alpha - angle of rotation: Passband orientation xu and yv frequency
%       subspaces
%       hth - Threshold value for hard-thresholding
%
% Outputs:
%       hxu - Impulse response of 2-D FIR fan filter
%       hxuht - Hard thresholded impulse response of 2-D FIR fan filter
%
% Other parameters:
%       B - Length of the bow-tie passband
%       T - Determines angular width of the bow-tie passband
%
% Instructions:
%       Comment the plotting commands when running 'test_rmse_alpha_hth',
%       'test_rmse_alpha_theta' and 'test_rmse_theta_hth'
% 
% Author - Chamira Edussooriya
% Edited by - Sanduni U. Premaratne
% Date - Apr 07, 2018
% Last modified - May 24, 2018

% clear variables; clc;
close all;

% Design of 2D filters Hxu and Hyv (both have the same specifications)
Mx = 11;            % length of filter for x dimension
Mu = 41;            % length of filter for u dimension
B = 0.9*pi;         % bandwidth of the filter
T = 0.08*pi;        % width of the transition band


hxu = firrtdfan([Mx,Mu],B,T,theta,alpha,'rec');
save('hxu.mat','hxu');

hxuht = hxu;
ind = abs(hxu) < hth*max(abs(hxu(:)));
hxuht(ind) = 0;
save('hxuht.mat','hxuht');

Fx = 256;           % length of the fft2 for x dimension 
Fu = 256;           % length of the fft2 for u dimension 

Hxu = fftshift(fft2(hxu,Fx,Fu));
Mxu = 20*log10(abs(Hxu));
Mxu(Mxu<-50) = -50;

wx = -1:2/Fx:1-2/Fx;        % frequency vector for x dimension
wu = -1:2/Fu:1-2/Fu;        % frequency vector for u dimension
[wx,wu] = ndgrid(wx,wu);

mesh(wx,wu,Mxu);
view(35,25);
grid on;
xlabel('\omega_x (\times\pi), rad/sample');
ylabel('\omega_u (\times\pi), rad/sample');
zlabel('Magnitude, dB');

figure;
spy(hxu);
ylabel('n_x');
xlabel('n_u');

Hxuht = fftshift(fft2(hxuht,Fx,Fu));
Mxuht = 20*log10(abs(Hxuht));
Mxuht(Mxuht<-50) = -50;

rmsefr = norm(Hxuht(:)-Hxu(:))/sqrt(Fx*Fu);
rmsemr = norm(abs(Hxuht(:))-abs(Hxu(:)))/sqrt(Fx*Fu);
rmsepr = norm(angle(Hxuht(:))-angle(Hxu(:)))/sqrt(Fx*Fu);
disp(['RMSE of Freq Resp = ',num2str(rmsefr),' units']);
disp(['RMSE of Mag Resp = ',num2str(rmsemr),' units']);
disp(['RMSE of Phs Resp = ',num2str(rmsepr),' units']);

figure;
mesh(wx,wu,Mxuht);
view(35,25);
grid on;
xlabel('\omega_x (\times\pi), rad/sample');
ylabel('\omega_u (\times\pi), rad/sample');
zlabel('Magnitude, dB');

figure;
spy(hxuht);
ylabel('n_x');
xlabel('n_u');

zCoef = size(hxuht(hxuht ~= 0),1)/(Mu*Mx);
out = [rmsefr rmsemr rmsepr zCoef];

