function writeColormapDiverging(mapname)

string0 = sprintf("function map = %s(varargin)", mapname); 

string1 = [...
"%% Prelims"
"ip = inputParser;"
"ip.addOptional('n', size(get(groot,'DefaultFigureColormap'),1));"
"ip.addParameter('center', 0);"
"ip.addParameter('clims', [-1 1]);"
"ip.addParameter('mode', 'trimmed', @(x) ismember(x, {'trimmed', 'complete'}));"
"ip.addParameter('Parent', get(groot,'CurrentFigure'));"
""
"ip.parse(varargin{:});"
"n = ip.Results.n; "
"clims = ip.Results.clims;"
"mode = ip.Results.mode; autoscaleColors = strcmpi(mode, 'trimmed');"
"Parent = ip.Results.Parent();"
""
""
"%% Sort out inputs (n, clim, colors)"
"ipiud = @(fieldname) any(strcmp( ip.UsingDefaults , fieldname ));"
"if ipiud('n')     && ~isempty(Parent) && isprop(Parent, 'Colormap'); n = height(get(Parent, 'Colormap')); end"
"if ipiud('clims') && ~isempty(Parent) && isprop(Parent, 'CLim');     clims = get(Parent, 'CLim');         end"
"clims = clims - ip.Results.center;"
""
"values = [..."
];

data = readmatrix(fullfile('data', 'processed', 'cmaps', mapname+".csv"));
string2 = sprintf("\t%f\t%f\t%f\n", data'); 

string3 = [...
"    ];"
"m = ceil(size(values,1)/2);"
""
""
"%% Calculations"
"if (clims(1) < 0) && (clims(2) > 0)"
""
"    r = abs(clims(1)) / clims(2); % Ratio of neg to pos"
"    neglen = round( n*r/(r+1) ) + (r<1); % favour the smaller half"
"    poslen = n - neglen + 1;"
""
"    % Just negative"
"    neglim = clims(1) - (autoscaleColors && r < 1)*sum(clims); % clims(1) or -clims(2)"
"    negmap = interp1( linspace( neglim,0,m), values( 1:m           , : ), linspace(clims(1),0,neglen) );"
""
"    % Just positive"
"    poslim = clims(2) - (autoscaleColors && r > 1)*sum(clims); % clims(2) or -clims(1)"
"    posmap = interp1( linspace( 0,poslim,m), values( (end-m+1):end , : ), linspace(0,clims(2),poslen) );"
""
"    % And put 'em together"
"    map = [negmap; posmap(2:end,:)];"
""
"else"
"    if clims(1) >= 0; map = values( (end-m+1):end , : ); % Just positive"
"    else; map = values(1:m,:); end % Just negative"
"    map = interp1(linspace(0, 1, m), map, linspace(0, 1, n));"
"end"
""
"map = min(max(map, 0), 1);"
""
""
"end"
""
]; 

writelines([string0; string1; string2; string3], mapname+".m"); 

end
