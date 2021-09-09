%--------------------------------------------------
% H  E  A  D  E  R
%--------------------------------------------------
% AUTHOR    | JAMES AKL
%--------------------------------------------------
% TASK      | FINITE ELEMENTS METHOD IMPLEMENTATION
%--------------------------------------------------

%--------------------------------------------------
% B  O  D  Y
%--------------------------------------------------
function C = Main(N)
tic
    %———DESCRIPTION———%
    %Outputs the FEM solution vector 'C' obtained using 'N' equally-sized
    %centered quadratic elements, under the given node numbering scheme.

    %———USER-INPUT ERROR-HANDLING———%
    if (N <= 0 || isinf(N) || floor(N) ~= N || ~isreal(N)) disp('ERROR: N must be a strictly positive integer.'); return; end;

	%———FORMULATION — INTEGRATION———%
    %Equally-sized elements.
    [h,ke] = deal(1/N, zeros(3,3));

    %Shape functions — Derivatives — Integrand of ke_ij.
    Psi = [2/h^2,-3/h,1;-4/h^2,4/h,0;2/h^2,-1/h,0];
    dPsi = [polyder(Psi(1,1:3));polyder(Psi(2,1:3));polyder(Psi(3,1:3))];
    integrand = @(I,J) [2*[0,conv(dPsi(I,1:2),dPsi(J,1:2))] + 10*conv(Psi(I,1:3),dPsi(J,1:2))];

    %Elementary coefficient matrix.
    for I = 1:3; for J = 1:3; ke(I,J) = GLQuad(integrand(I,J),h); end; end;

    %———ASSEMBLY — BOUNDARY CONDITIONS — RESOLUTION———%
    [I,J] = deal([1:(2*N+1),2:N,2:N,2:N,(N+2):(2*N+1),2:(N),(N+2):(2*N+1)],[1:(2*N+1),3:(N+1),1:(N-1),(N+3):(2*N+1),1:N,(N+2):2*N,2:(N+1)]);
    [V] = [1,repelem(ke(1,1)+ke(3,3),N-1),1,repelem(ke(2,2),N),repelem(ke(1,3),N-1),repelem(ke(3,1),N-1),repelem(ke(1,2),N-1),repelem(ke(2,1),N),repelem(ke(3,2),N-1),repelem(ke(2,3),N)];
    [K,Q] = deal(sparse(I,J,V,2*N+1,2*N+1),sparse([N+1],[1],[1],2*N+1,1)); 
    [C] = K\Q;
toc
end

%———PERFORMANCE MEASUREMENTS———%
%Processor: Intel Core i5-4700MQ CPU @2.40GHz
%Main(N = 1000) takes 0.00416 seconds.
%Main(N = 10000) takes 0.0339 seconds.
%Main(N = 100000) takes 0.381 seconds.
%Main(N = 1000000) takes 4.18 seconds.
