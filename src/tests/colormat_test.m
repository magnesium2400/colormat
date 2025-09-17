%%% Shared variables
n = @nexttile; 
m = magic(randsample([20,21,22],1)); 


%% Simple tests with parula
figure; imagesc(m); colorbar; colormat(parula); 
figure; imagesc(m); colorbar; colormat(parula(10)); 
figure; imagesc(m); colorbar; colormat('parula'); 
figure; imagesc(m); colorbar; colormat("parula"); 


%% Simple tests with turbo
figure; imagesc(m); colorbar; colormat(turbo); 
figure; imagesc(m); colorbar; colormat(turbo(10)); 
figure; imagesc(m); colorbar; colormat('turbo'); 
figure; imagesc(m); colorbar; colormat("turbo"); 


%% Simple tests with multiple axes

% this changes the whole figure
figure; imagesc(nexttile, m); colorbar; imagesc(nexttile, m); colorbar; 
colormat(turbo); 
title(gcf().Children, 'Changes the whole figure'); 

% this changes the whole figure
figure; imagesc(nexttile, m); colorbar; imagesc(nexttile, m); colorbar; 
colormat(turbo, 'Parent', gcf);
title(gcf().Children, 'Changes the whole figure'); 

% this changes the first axes
figure; imagesc(nexttile, m); colorbar; imagesc(nexttile, m); colorbar; 
colormat(nexttile(gcf().Children,1), turbo); 
title(gcf().Children, 'Changes the first axes'); 

% this changes the second axes
figure; imagesc(nexttile, m); colorbar; imagesc(nexttile, m); colorbar; 
colormat(nexttile(gcf().Children,2), turbo); 
title(gcf().Children, 'Changes the second axes'); 

% this changes the second axes
figure; imagesc(nexttile, m); colorbar; imagesc(nexttile, m); colorbar; 
colormat(gca(), turbo); 
title(gcf().Children, 'Changes the second axes'); 



% changing the whole figure this way is not yet supported
% figure; imagesc(nexttile, m); colorbar; imagesc(nexttile, m); colorbar; 
% colormat(gcf, turbo); 




