% d = dir(fullfile(fileparts(which('colormat.m')), 'data', 'processed', 'cmaps', '*.csv'));
% 
% figure; imagesc(magic(255)); colorbar;
% xlabel('Press any key to progress or Ctrl+C to exit');
% 
% for ii = 1:length(d)
%     [~,n] = fileparts(fullfile(d(ii).folder, d(ii).name));
%     cmap = eval(n);
%     colormap(cmap);
%     title(d(ii).name);
%     pause();
% end

%% Show maps by reading functions 
d = readtable(fullfile(fileparts(which('colormat.m')),'..','data','processed','cmaps.csv'));
figure; imagesc(magic(255)); colorbar;
xlabel('Press any key to progress or Ctrl+C to exit');
for ii = 1:height(d)
    switch d{ii,'Type'}{1}
        case {'q','s','c','d'}
            cmap = eval(d{ii,'Name'}{1});
            colormap(cmap);
            title(d{ii,'Name'}{1});
            pause();   
        otherwise
    end
end
