(* ::Package:: *)

clear
clc
'Datos iniciales
nn = input('Ingresa el numero de variables.');
for ii = 1:nn
    
    eval(sprintf('x % d = sym(''x % d'');', ii, ii))
    
end
f = input('Ingresa la funci\[OAcute]n en terminos de  x1 .... xn.');
arg_names = symvar(f);
f = symfun(f, arg_names);
syms phi(t)
x0 = input('Ingresa el punto inicial.');
norma = 1;
xi = x0;
g = gradient(f, arg_names);
jj=1;

'Algoritmo
while norma > eps
    
    gt = double(subs(g, arg_names, xi));
    
    if gt == 0
        break;
    end
    
    tt = xi - t*gt';
    phi = (subs(f, arg_names, tt));
    phi = symfun(phi, t);
    phi(t) = simplify(phi);
    phi_dash = diff(phi);
    ti = solve(phi_dash, t);
    ti = double(ti);
    im = imag(ti);
    re = real(ti);
    ri = im./re;
    ti(ri>1e-3) = [];
    ti = real(ti);
    temp = double(phi(ti));
    [~, te] = min(abs(temp));
    ti = ti(te);
    
    xt = xi;
    xi = xi - ti*gt'
    
    norma = (xi-xt)*(xi-xt)'
    error(jj)=norma;
    jj=jj+1;
end
jj=1:jj-1;

disp (strrep (['La soluci\[OAcute]n es [' num2str (xi, ' %0 .2d') ']'], ',)', ')'))
