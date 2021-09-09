%----------------------------------------------------
% H  E  A  D  E  R
%----------------------------------------------------
% AUTHOR     | JAMES AKL
%----------------------------------------------------
% TASK       | GAUSS-LEGENDRE QUADRATURE
%----------------------------------------------------

%----------------------------------------------------
% B  O  D  Y
%----------------------------------------------------
function kij = GLQuad(f,h)

	%---DESCRIPTION---%
    %Outputs the exact value of the desired integral, computed numerically
    %using the Gauss-Legendre Quadrature. Refer to FEM_Report section 2.

    %---VARIABLE DECLERATIONS---%
    x = [h/2*(1+1/sqrt(3)),h/2*(1-1/sqrt(3))]; %Gauss points.
    p = polyval(f,x); %Evaluate the integrand at the Gauss points.
    kij = h/2*(p(1)+p(2)); 

end
