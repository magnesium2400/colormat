% d = dir(fullfile(fileparts(which('colormat.m')),'data','processed','cmaps','*.csv')); 
% for ii = 1:length(d)
%     [~,n] = fileparts(d(ii).name); 
%     writeColormatFunction(n); 
% end

%%

d = readtable(fullfile(fileparts(which('colormat.m')),'..','data','processed','cmaps.csv'), 'FileType','text');
for ii = 1:height(d)
    switch d{ii,'Type'}{1}
        case 'q'; writeColormapQualitative(d{ii,'Name'}{1});        
        case 's'; writeColormapSequential( d{ii,'Name'}{1});
        case 'c'; writeColormapCyclic(     d{ii,'Name'}{1});
        case 'd'; writeColormapDiverging(  d{ii,'Name'}{1});
    end
end


