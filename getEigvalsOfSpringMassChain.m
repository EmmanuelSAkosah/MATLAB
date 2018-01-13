%Emmanuel S Akosah, Craig Calhoun
%Engs 23 HW Que4

% a.) function to calculate eigenvalues for different-sized matrices

function [chainMatrix, Eigvals] = getEigvalsOfSpringMassChain(N)
%input : N = the size of the matrix representing the chain 
%output : Eigvals = a vector containg the eigenvalues of the chain matrix

%check input
if N < 4
    N = 4;
end 

%construct the chain matrix
Diag = diag(-2*ones(1,N));  % the main diagonal of -2's
UpperDiag = diag(ones(1,N-1),1); % super diagonal of 1's
LowerDiag = diag(ones(1,N-1),-1);  %  sub diagonal of 1's
A = Diag + UpperDiag + LowerDiag;
chainMatrix = A;
    
%get Eigenvalues of the chain matrix
Eigvals = eig(A);  
end