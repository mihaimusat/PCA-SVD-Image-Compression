% Musat Mihai-Robert 313CB

function A_k = cerinta1(image, k)
  
  A = imread(image);
  A = double(A);
  [U S V] = svd(A);
  U_k = U(:, 1:k);       % extrag primele k coloane 
  S_k = S(1:k, 1:k);     % fac o submatrice de dimensiune k*k
  V_k = (V')(1:k, :);    % extrag primele k linii
  A_k = U_k * S_k * V_k; % obtin descompunerea redusa a valorilor singulare 
  
endfunction 