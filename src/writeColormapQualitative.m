function writeColormapQualitative(mapname)
%% See also
% `lines` for an example of a qualitative colormap with many values and the way to cycle through them as done by MathWorks.

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
"c = ["
];

data = readmatrix(fullfile('data', 'processed', 'cmaps', mapname+".csv"));
string2 = sprintf("\t%f\t%f\t%f\n", data'); 

string3 = [...
"    ];"
""
"map = c(rem(0:m-1,size(c,1))+1,:);"
""
"end"  
]; 

writelines([string0; string1; string2; string3], mapname+".m"); 

end
