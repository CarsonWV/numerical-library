function [x, y] = import_duck_points()
% Import the x-y points for the underside of the duck on page 150,
% fig 3.10 in the 7th ed. of Burden - Numerical Analysis.

% Data captued using the tool at the following link (BE CAREFUL):
% https://www.mobilefish.com/services/record_mouse_coordinates/record_mouse_coordinates.php

% NOTE:
% Since the profile fails the vertical line test, you'll need 3 splines.
% (Indexes  1 - 10) Duck beak to beginning of wing.
% (Indexes 10 - 15) Beginning of wing to tip of wing.
% (Indexes 15 - 30) Tip of wing to tail of duck.

tab = readtable("duck_points.csv");
tab = table2array(tab);
x = tab(:, 1).';
y = tab(:, 2).';

% Use the following code in your project file:
% [duck_x_values, duck_y_values] = import_duck_points()