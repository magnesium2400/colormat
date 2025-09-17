function map = pastel1(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

c = [
	0.984314	0.705882	0.682353
	0.701961	0.803922	0.890196
	0.800000	0.921569	0.772549
	0.870588	0.796078	0.894118
	0.996078	0.850980	0.650980
	1.000000	1.000000	0.800000
	0.898039	0.847059	0.741176
	0.992157	0.854902	0.925490
	0.949020	0.949020	0.949020

    ];

map = c(rem(0:m-1,size(c,1))+1,:);

end
