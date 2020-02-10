% Musat Mihai-Robert 313CB 

function [A_k S] = cerinta3(image, k)
  
  A = imread(image);
  A = double(A);
  [m n] = size(A);
  Z = zeros(n, m);
  W = zeros(m, m);
  Y = zeros(m, n);
  media = zeros(m, 1);
  
  for i = 1:m 
    for j = 1:n
      media(i) = media(i) + A(i, j) / n; % calculez media pentru fiecare vector
    endfor
    for j = 1:n
      A(i, j) = A(i, j) - media(i); % actualizez media pentru fiecare element din vector
    endfor
  endfor
  
  % aplic formulele conform enuntului 
  Z = 1 / sqrt(n - 1) * A';
  [U S V] = svd(Z);
  for i = 1:m 
    for j = 1:k
      W(i, j) = V(i, j);
    endfor 
  endfor
  Y = W' * A;
  A_k = W * Y + media;
  
endfunction