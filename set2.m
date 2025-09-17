function map = set2(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

c = [
	0.400000	0.760784	0.647059
	0.988235	0.552941	0.384314
	0.552941	0.627451	0.796078
	0.905882	0.541176	0.764706
	0.650980	0.847059	0.329412
	1.000000	0.850980	0.184314
	0.898039	0.768627	0.580392
	0.701961	0.701961	0.701961

    ];

map = c(rem(0:m-1,size(c,1))+1,:);

end
