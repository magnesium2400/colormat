d = dir('data/processed/cmaps/*.csv'); 

figure; imagesc(magic(255)); colorbar; 

for ii = 1:length(d)
    cmap = readmatrix(fullfile(d(ii).folder, d(ii).name)); 
    colormap(cmap); 
    title(d(ii).name); 
    xlabel('Press any key to progress or Ctrl+C to exit');
    pause(); 
end





