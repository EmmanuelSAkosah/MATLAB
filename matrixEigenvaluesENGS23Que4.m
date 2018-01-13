%Emmanuel S Akosah, Craig Calhoun
%Engs 23 HW Que4

% a.) Eigenvalues for different size matrices
%Answer to a.) in the stand-alone function getEigvalsOfSpringMassChain


    %  function to calculate eigenvalues for different-sized matrices
    % 
    % function [chainMatrix, Eigvals] = getEigvalsOfSpringMassChain(N)
    % %input : N = the size of the matrix representing the chain 
    % %output : Eigvals = a vector containg the eigenvalues of the chain matrix
    % 
    % %check input
    % if N < 4
    %     N = 4;
    % end 
    % 
    % %construct the chain matrix
    % Diag = diag(-2*ones(1,N));  % the main diagonal of -2's
    % UpperDiag = diag(ones(1,N-1),1); % super diagonal of 1's
    % LowerDiag = diag(ones(1,N-1),-1);  %  sub diagonal of 1's
    % A = Diag + UpperDiag + LowerDiag;
    % chainMatrix = A;
    %     
    % %get Eigenvalues of the chain matrix
    % Eigvals = eig(A);  
    % end


% b.)  Eigenvalues for different size matrices

N = [4,10,20,30,50];
for i=1:length(N);
    
   [chainMatrix, Eigvals] = getEigvalsOfSpringMassChain(N(i));
   sort(Eigvals,'descend')  % sort to get top 4 eigenvalues
   Top4Eigenvals = Eigvals(1:4);
    
   %plot Eigenvlues
   figure 
   scatter(1:1:4,Top4Eigenvals) 
   titleInfo = sprintf('Top 4 Eigenvalues of %iX%i matrix', N(i),N(i));
   title(titleInfo)
   ylabel('Eigenvalues')
   xlabel('Index')
   
   %plot all the eigenvalues of the 50X50 matrix
   if N(i) == 50
       figure 
       NumericalEigvals = Eigvals;
       scatter(1:1:50,Eigvals)
       titleInfo = sprintf('All Eigenvalues of %iX%i matrix', N(i),N(i));
       title(titleInfo)  
       ylabel('Eigenvalues')
       xlabel('Node')
       hold off
   end
   
   
end     

% Observation
% The values of the 4 largest eigenvalue for all the different sized matrices
% are very similar.  Also, the relation(slope) between the 4 largest eigenvalue in
% the case of each matrix is similar to one another
% 
% The plot of all the eigenvalues of the 50X50 matrix has a sigmoid nature.


 
% c.) analytical solution of eigenvalues for a symmetric tri-diagonal matrix 
N = 50; 
m = 0:1:N-1;
alpha = m*pi/(N+1);
lamda = -2 + 2*cos(alpha);

analyticalEigenvals = fliplr(lamda);
%plot analytical sol vs numerical
figure
scatter(1:1:length(m),analyticalEigenvals)
hold on
scatter(1:1:length(m),NumericalEigvals)
title('All Eigenvalues of 50X50 matrix') 
ylabel('Eigenvector') 
xlabel('node') 
legend('Analytical', 'Numerical')
hold off  

% d.)
N = 4;
[chainMatrix4X4, Eigvals] = getEigvalsOfSpringMassChain(N);
[Eigvecs, Eigvals] = eig(chainMatrix4X4); %get eigenvectors
Eigvals = diag(Eigvals);

%plot eigenvectors of the mass-spring chain
figure
for i=1:length(Eigvecs)  
    
   Eigvec =  Eigvecs(:,i); %get eigenvectors in column vector-from matrix   
   subplot(2,2,i)
   scatter(1:1:4,Eigvec);
   hold on

   plot([0,4],[0,0])    % draw horizontal zero axis%    
   for k=1:length(Eigvec)               % draw lines joining points to 
     plot([k,k],[0,Eigvec(k)],'k')      % the horizontal zero axis
   end

   %plot labelling
   titleInfo = sprintf('Eigenvalue = %f', Eigvals(i));
   title(titleInfo)
   ylabel('Eigenvector')
   xlabel('node')
    
   
end
hold off