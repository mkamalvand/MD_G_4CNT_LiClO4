clear
clc
load allcharges_DownPos.mat
%load allcharges_DownNeg.mat
%load allcharges_DownNeg.mat
d_x = 0.5;
d_y = 0.5;
d_z = 0.05;
z_min = 0;
z_max = 25;
z_com = 0;
x_i = 20;
y_i = 20;

% 20 : 20  20 13.5
% 15 : 42  42  10.1
% 11 : 15 45   7.4 
% 7  : 46 12   4.7

x_f = x_i;
y_f = y_i;

% x_f = 61.5;
% y_f = 64;


%==================
X = x_i : d_x : x_f;
Y = y_i : d_y : y_f;

epsilon_0 = 8.854e-12;
epsilon_r = 78;
m2ang = 1e10;
q_e =  1.602e-19;
coeff = m2ang .* q_e ./(4 * pi * epsilon_r * epsilon_0);
q_H = coord_count(: , 4) .* 0.4238;
q_Li = coord_count(: , 5) .* 0.8 ;
q_O = coord_count(: , 6) .* (-0.8476);
q_ClO4 = coord_count(: , 7) .* (-0.8);
q_tot = q_H + q_O + q_Li + q_ClO4;
type = electrode_xyzQ(: , 1);
 
x_C = electrode(: , 2);
y_C = electrode(: , 3);
z_C = electrode(: , 4);
q_C = electrode(: , 5);
x_soln = coord_count(: , 1);
y_soln = coord_count(: , 2);
z_soln = coord_count(: , 3);
gx = 0;
for gx = 1 : length(X);
    x_com = X(gx)
    gy = 0;
    for gy = 1 : length(Y)
        y_com = Y(gy);
        gz = 0;
        for z = z_min : d_z : z_max
            gz = gz + 1;
            R_soln = sqrt((x_soln- x_com) .^ 2 + (y_soln - y_com) .^ 2 + (z_soln - z) .^ 2);
            R_electrode = sqrt((x_C - x_com) .^ 2 + (y_C - y_com) .^ 2 + (z_C - z).^ 2);
            R_soln(R_soln <  1e-5) = 1000;
            R_electrode(R_electrode < 1e-5) = 1000;
            phi_soln(gz) = coeff * sum(q_tot ./ R_soln);
            phi_electrode(gz) = coeff * sum(q_C ./ R_electrode);
        end
        z = z_min : d_z : z_max;
        phi = phi_soln + phi_electrode;
        psi(gx , gy , 1 : length(phi)) = phi;
        psi_electrode(gx , gy , 1 : length(phi)) = phi_electrode;
        psi_soln(gx , gy , 1 : length(phi)) = phi_soln;
    end
end
z = z_min : d_z  : z_max;
if length(x_com) == 1 & length(y_com) == 1
    gz = 0;
    for z  = z_min : d_z  : z_max;
        gz = gz + 1;
        Psi_soln(gz) = psi_soln(1 , 1 , gz);
        Psi_electrode(gz) = psi_electrode(1 , 1 , gz);
        Psi(gz) = psi(1 , 1 , gz);
    end
    z  = z_min : d_z  : z_max;
    plot(z , Psi,z, Psi_soln)
else
    mesh(X , Y , psi)
end
A = [Psi ; Psi_electrode]';
        

