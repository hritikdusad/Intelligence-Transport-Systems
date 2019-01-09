%% Integer linear programming
clc,clear,close all

%write the objective function

f = [1; 1; 1; 1; 1; 1];
intcon = 6;

%convert all inequilities in form  A*x <= b;
 % -40a <= -5000
 % -40a - 40b <= -60000
 % -40b - 40c <= -10000
 % -40c - 40d <= -30000
 % -40d - 40e <= -20000
 % -40e - 40f <= -40000
 %-a <= 0
 %-b <= 0
 %-c <= 0
 %-d <= 0
 %-e <= 0
 %-f <= 0
 
 % null equivalent equation of A
Aeq  = [];

% null equivalent equation of B
Beq  = [];
 
% null equivalent equation of Z
zeq  = [];
 
 

%cofficient matrix

A = [ 
    -40,0,0,0,0,0 ; 
    
    -40,-40,0,0,0,0 ;
    
    0,-40,-40,0,0,0;
    
    0,0,-40,-40,0,0;
    
    0,0,0,-40,-40,0;
    
    0,0,0,0,-40,-40;
    
    -1,0,0,0,0,0;
    
    0,-1,0,0,0,0;
    
    0,0,-1,0,0,0;
    
    0,0,0,-1,0,0;
    
    0,0,0,0,-1,0;
    
    0,0,0,0,0,-1
   ];

%constant matrix
B = [
    
    -5000 ;
    
    - 60000;
    
    - 10000 ;
    
    - 30000 ;
    
    - 20000;
    
    - 40000;
    
    0;
    
    0;
    
    0;
    
    0;
    
    0;
    
    0
    ];    

%lower-bound
lb = [0,0,0,0,0,0];

%upper-bound
ub = [1000,1000,1000,1000,1000,1000];


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


% now call the algorithm for integer programming
% This will give the required optimized value for the given equation


