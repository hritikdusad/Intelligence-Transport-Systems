%% Integer linear programming
clc,clear,close all

%write the objective function

f = [350; 50; -10000 ];
intcon = 3;

%convert all inequilities in form  A*x <= b;
% where x is number of public vehicle
% where y is number of private vehicle
% public vehicle can accomodate a maximum of 40 passangers
% public vehicle can accomodate a maximumof 4 passangers



% -40x - 4y <= -200000
% -50x + y <= 0
% x + y <= 50000
% -x <= 0
% -y <= 0
% -100z + x <= 0 


% null equivalent equation of A
Aeq  = [];

% null equivalent equation of B
Beq  = [];
 
% null equivalent equation of Z
zeq  = [];




%cofficient matrix 
A = [ 
    -40, -4, 0 ; 
    -50,  1, 0 ;
    1, 1, 0 ; 
    -1, 0, 0;
    0, -1, 0;
    -1,0,100
    ];

% constant matrix
B = [
    -200000 ;
    0 ;
    50000;
    0 ;
    0;
    0
    ];   

%lower bound

 lb=[0, 0];
 
 %upper -bound
 
 ub=[1000, 50000];
 
 
 % now call the algorithm for integer programming
% This will give the required optimized value for the given equation using
% simplex method


options = optimoptions('linprog','Algorithm','simplex');

[x,fval,exitflag, output]=linprog(f, A, B, Aeq, Beq, lb, ub,[],options)
  

 % now call the algorithm for integer programming
% This will give the required optimized value for the given equation using
% dual-simplex

  options = optimoptions('linprog','Algorithm','dual-simplex');
  

[x,fval,exitflag, output]=linprog(f, A, B, Aeq, Beq, lb, ub,[],options)

 % now call the algorithm for integer programming
% This will give the required optimized value for the given equation using
%interior point

options = optimoptions('linprog','Algorithm','interior-point');

[x,fval,exitflag, output]=linprog(f, A, B, Aeq, Beq, lb, ub,[],options)



% now call the algorithm for integer programming
% This will give the required optimized value for the given equation







