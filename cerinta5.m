% Musat Mihai-Robert 313CB

function cerinta5()
  
  % primul subpunct
  A = imread('in/images/image1.gif');
  A = double(A);
  [UA SA VA] = svd(A);
  diagSA = diag(SA); % extrag diagonala principala din matricea S a primei imagini
  
  figure;
  plot(diagSA);
  title('Reprezentarea vectorului diag(S) pentru image1 si image2');
  hold on;
  
  % analog pentru a doua imagine
  B = imread('in/images/image2.gif');
  B = double(B);
  [UB SB VB] = svd(B);
  diagSB = diag(SB);
  
  plot(diagSB);
  hold off;
  
  % al doilea subpunct 
  [mA nA] = size(A);
  k = [1:19];
  infoA = zeros(length(k), 1);
  [A_k SkA] = cerinta3('in/images/image1.gif', k); % obtin matricea redusa cu PCA
  suma2 = 0;
  for j = 1:min(mA, nA) 
    suma2 = suma2 + SkA(j, j); % calculez suma de la numitor
  endfor
  for i = 1:19
    suma1 = 0;
  for j = 1:i
    suma1 = suma1 + SkA(j, j); % calculez suma de la numarator
  endfor
    infoA(i) = suma1 / suma2; % informatia cautata este raportul sumelor
  endfor
  
  figure;
  plot(k, infoA);
  title('Informatia data de primele k valori singulare cu PCA pentru image1 si image2');
  hold on;
  
  % analog pentru a doua imagine
  [mB nB] = size(B);
  k = [1:19];
  infoB = zeros(length(k), 1);
  [B_k SkB] = cerinta3('in/images/image2.gif', k);
  suma2 = 0;
  for j = 1:min(mB, nB) 
    suma2 = suma2 + SkB(j, j);
  endfor
  for i = 1:19
    suma1 = 0;
  for j = 1:i
    suma1 = suma1 + SkB(j, j);
  endfor
    infoB(i) = suma1 / suma2;
  endfor
  
  plot(k, infoB);
  hold off;
  
  % al treilea subpunct
  k = [1:19];
  errA = zeros(length(k), 1);
  for l = 1:19 
    for i = 1:length(k)
    errA(l) = k(i); % pun elementele vectorului k in alt vector
    endfor 
  endfor
  for k = 1:19 
    [A_k S] = cerinta3('in/images/image1.gif', k); % pentru fiecare valoare din vector am alta matrice
    for i = 1:mA
      for j = 1:nA 
        errA(k) = errA(k) + 1 / (mA * nA) * (A(i, j) - A_k(i, j))^2; % actualizez vectorul de valori
      endfor
    endfor
  endfor
  
  k = [1:19]; % am grija sa nu pierd valorile din vector
  figure;
  plot(k, errA);
  title('Eroarea aproximarii matricelor cu PCA pentru image1 si image2');
  hold on;
  
  % analog pentru a doua imagine
  k = [1:19];
  errB = zeros(length(k), 1);
  for l = 1:19 
    for i = 1:length(k)
    errB(l) = k(i);
    endfor 
  endfor
  for k = 1:19 
    [B_k S] = cerinta3('in/images/image2.gif', k);
    for i = 1:mB
      for j = 1:nB 
        errB(k) = errB(k) + 1 / (mB * nB) * (B(i, j) - B_k(i, j))^2;
      endfor
    endfor
  endfor
  
  k = [1:19];
  plot(k, errB);
  hold off;

  % al patrulea subpunct 
  compA = zeros(length(k), 1);
  for i = 1:length(k) 
    compA(i) = (2 * k(i) + 1) / nA; % rata de compresie a datelor pentru matricea A
  endfor
  
  figure;
  plot(k, compA);
  title('Rata de compresie a datelor cu PCA pentru image1 si image2');
  hold on;
  
  % analog pentru a doua imagine 
  compB = zeros(length(k), 1);
  for i = 1:length(k) 
    compB(i) = (2 * k(i) + 1) / nB;
  endfor
  
  plot(k, compB);
  hold off;
  
endfunction 
