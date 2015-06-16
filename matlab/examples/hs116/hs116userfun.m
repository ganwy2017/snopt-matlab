function [F,G] = hs116userfun(x)
% Defines nonlinear terms of F and derivatives for HS 116.
% Linear constraints are explicit.

% Parameters
    a   = 2e-3;
    b   = 1.262626;
    c   = 1.231059;
    d   = 3.475e-2;
    e   = 9.75e-1;
    f   = 9.75e-3;
    Obj = 5;

F = [ 1,  0;
      2,  0;
      3,  0;
      4,  0;
      5,  0;
      6, -b*x(10) + c*x(3)*x(10);                %
      7,  x(5)  - d*x(2)  - e*x(2)*x(5) + f*x(2)^2;      %
      8,  x(6)  - d*x(3)  - e*x(3)*x(6) + f*x(3)^2;      %
      9,  x(4)  - d*x(1)  - e*x(1)*x(4) + f*x(1)^2;      %
     10, -b*x(9)  + c*x(2)*x(9);                 %
     11, -b*x(8)  + c*x(1)*x(8);                 %
     12,  x(5)*x(7) - x(1)*x(8) - x(4)*x(7) + x(4)*x(8); %
     13,  x(6)      + x(5) + a*(x(2)*x(9) + x(5)*x(8) - x(1)*x(8) - x(6)*x(9)); %
     14, -500*(x(2) - x(6)) + x(2)*x(9) - x(3)*x(10) - x(6)*x(9) + x(2)*x(10);  %
     15,  x(2)      - a*(x(2)*x(10) - x(3)*x(10))   ];      %
F = F(:,2);

% Define the derivatives.
G = [   6,  3,  c*x(10);
        6, 10, -b + c*x(3);
        7,  2, -d - e*x(5) + 2*f*x(2);
        7,  5,  1 - e*x(2);
        8,  3, -d - e*x(6) + 2*f*x(3);
        8,  6,  1 - e*x(3);
        9,  1, -d - e*x(4) + 2*f*x(1);
        9,  4,  1 - e*x(1);
       10,  2,  c*x(9);
       10,  9, -b + c*x(2);
       11,  1,  c*x(8);
       11,  8, -b + c*x(1);
       12,  1, -x(8);
       12,  4, -x(7) + x(8);
       12,  5,  x(7);
       12,  7,  x(5) - x(4);
       12,  8, -x(1) + x(4);
       13,  1, -a*x(8);
       13,  2,  a*x(9);
       13,  5,  1 + a*x(8);
       13,  6,  1 - a*x(9);
       13,  8,  a*(x(5) - x(1));
       13,  9,  a*(x(2) - x(6));
       14,  2, -500 + x(9) + x(10);
       14,  3, -x(10);
       14,  6,  500 - x(9);
       14,  9,  x(2) - x(6);
       14, 10, -x(3) + x(2);
       15,  2,  1 - a*x(10);
       15,  3,  a*x(10);
       15, 10, -a*(x(2) - x(3))    ];
G = G(:,3);