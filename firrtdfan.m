function h = firrtdfan(size,B,T,theta,alpha,win)

% FIRRTDFAN is used to design 2D FIR fan filters based on the second method
% (rotated fan filter) presented in "Pei1994". The finite-extent impulse
% response is obtained by employing a 2D window function.
% Reference -
%   S.-C. Pei and S.-B. Jaw, “Two-dimensional general fan-type FIR digital
%   filter design,” Signal Process., vol. 37, no. 2, pp. 265–-274, 1994.
% Inputs
%   size - vector containing the size of the filter (should be odd x odd)
%   B - bandwidth of the filter
%   T - width of the transition band 
%   theta - half-fan angle
%   alpha - angle of rotation with respect to the first dimension
%   win - string containing the window function (should be "rec" or "ham")
% Output
%   h - finite-extent impulse response of the filter
% 
% Author - Chamira Edussooriya
% Edited by - Sanduni U. Premaratne
% Date - Jul 05, 2015
% Last modified - Jul 06, 2015

a = tand(theta);        % parameter that determines the impulse response
b = T/cosd(theta);      % parameter that determines the impulse response

M1 = size(1);           % length for the first dimension
M2 = size(2);           % length for the second dimension

[m1,m2] = ndgrid(-(M1-1)/2:(M1-1)/2, -(M2-1)/2:(M2-1)/2);
n1 = m1*cosd(alpha) + m2*sind(alpha);   % ## rotated coordinate
n2 = m2*cosd(alpha) - m1*sind(alpha);   % system ##

temp1 = (cos(b*n2)-cos(B*n1+a*B*n2+b*n2)) ./ (n1+a*n2);
temp2 = (cos(b*n2)-cos(B*n1-a*B*n2-b*n2)) ./ (n1-a*n2);
h = (temp1-temp2) ./ (4*pi^2*n2);
    % for n2 ~= 0, n1+a*n2 ~= 0 and n1-a*n2 ~= 0
ind = (n2==0);
temp1 = a*(cos(B*n1(ind))-1) ./ n1(ind);
h(ind) = ((a*B+b)*sin(B*n1(ind))+temp1) ./ (2*pi^2*n1(ind)); 
    % for n2 = 0, n1+a*n2 ~= 0 and n1-a*n2 ~= 0
ind = (n1+a*n2==0);
temp1 = (cos(b*n2(ind))-cos(B*n1(ind)-a*B*n2(ind)-b*n2(ind))) ./...
        (n1(ind)-a*n2(ind));
h(ind) = (B*sin(b*n2(ind))-temp1) ./ (4*pi^2*n2(ind));
    % for n2 ~= 0, n1+a*n2 = 0 and n1-a*n2 ~= 0
ind = (n1-a*n2==0);
temp1 = (cos(b*n2(ind))-cos(B*n1(ind)+a*B*n2(ind)+b*n2(ind))) ./...
        (n1(ind)+a*n2(ind));
h(ind) = (B*sin(b*n2(ind))+temp1) ./ (4*pi^2*n2(ind));
    % for n2 ~= 0, n1+a*n2 ~= 0 and n1-a*n2 = 0
h((M1+1)/2,(M2+1)/2) = B*(a*B+2*b) / (4*pi^2);      
    % n1 = n2 = 0

if strcmp(win,'rec') == 1           % determine the window function
    win2d = ones(M1,M2);
elseif strcmp(win,'ham') == 1
    win2d = hamming(M1) * hamming(M2)';
end

h = h .* win2d;                     % multiply with the 2D window
h = h / sum(h(:));                  % make magnitude at origin is unity

