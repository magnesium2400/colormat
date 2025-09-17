function writeColormapCyclic(mapname)
%% See also
% `writeColormapSequential`, on which this is based.

string0 = sprintf("function map = %s(m,center)", mapname); 

string1 = [...
"if nargin < 1"
"   f = get(groot,'CurrentFigure');"
"   if isempty(f)"
"      m = size(get(groot,'DefaultFigureColormap'),1);"
"   else"
"      m = size(f.Colormap,1);"
"   end"
"end"
""
"if nargin < 2; center = 0; end"
""
"values = ["
];

data = readmatrix(fullfile('data', 'processed', 'cmaps', mapname+".csv"));
string2 = sprintf("\t%f\t%f\t%f\n", data'); 

string3 = [...
"    ];"
""
"P = size(values,1);"
"map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');"
"center = floor(mod(center,1)*height(map))+1;" % not ceil because of 0
"map = map([center:end, 1:center-1], :);"
""
"end"  
]; 

writelines([string0; string1; string2; string3], mapname+".m"); 

end
