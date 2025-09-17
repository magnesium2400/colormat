function writeColormapSequential(mapname)
%% See also
% `turbo` for an example of a sequential colormap with many values and the interpolation scheme used by MathWorks.

string0 = sprintf("function map = %s(m)", mapname); 

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
"values = ["
];

data = readmatrix(fullfile('data', 'processed', 'cmaps', mapname+".csv"));
string2 = sprintf("\t%f\t%f\t%f\n", data'); 

string3 = [...
"    ];"
""
"P = size(values,1);"
"map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');"
""
"end"  
]; 

writelines([string0; string1; string2; string3], mapname+".m"); 

end
