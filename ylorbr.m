function map = ylorbr(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	1.000000	1.000000	0.898039
	1.000000	0.968627	0.737255
	0.996078	0.890196	0.568627
	0.996078	0.768627	0.309804
	0.996078	0.600000	0.160784
	0.925490	0.439216	0.078431
	0.800000	0.298039	0.007843
	0.600000	0.203922	0.015686
	0.400000	0.145098	0.023529

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
