function map = orrd(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	1.000000	0.968627	0.925490
	0.996078	0.909804	0.784314
	0.992157	0.831373	0.619608
	0.992157	0.733333	0.517647
	0.988235	0.552941	0.349020
	0.937255	0.396078	0.282353
	0.843137	0.188235	0.121569
	0.701961	0.000000	0.000000
	0.498039	0.000000	0.000000

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
