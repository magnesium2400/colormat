
%% Make figures
outputdir = fullfile(fileparts(which('colormat.m')),'..','docs','images');
d = readtable(fullfile(fileparts(which('colormat.m')),'..','data','processed','cmaps.csv'));
im = repelem(0:255, 33, 2);
% figure; imagesc(im); colorbar; 
for ii = 1:height(d)
    switch d{ii,'Type'}{1}
        case {'q', 's','c','d'}
            cmap = eval(d{ii,'Name'}{1});
            outputname = fullfile(outputdir, d{ii,'Name'}{1} + ".png");
            % colormap(cmap); 
            % pause(); 
            imwrite(im, cmap, outputname); 
        otherwise
    end
end


%% Make table data with images to be copy-pasted into readme
d = readtable(fullfile(fileparts(which('colormat.m')),'..','data','processed','cmaps.csv'));
fprintf('\n| Name | Source | Map |\n| :--: | :----: | :-: |\n');
for ii = 1:height(d)
    switch d{ii,'Type'}{1}
        case {'q', 's','c','d'}
           fprintf('| %s | %s | ![%s](./docs/images/%s.png) |\n',...
               d{ii,'Name'}{1},d{ii,'Source'}{1},d{ii,'Name'}{1},d{ii,'Name'}{1})
        otherwise
    end
end