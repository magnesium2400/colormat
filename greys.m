function map = greys(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	1.000000	1.000000	1.000000
	0.941176	0.941176	0.941176
	0.850980	0.850980	0.850980
	0.741176	0.741176	0.741176
	0.588235	0.588235	0.588235
	0.450980	0.450980	0.450980
	0.321569	0.321569	0.321569
	0.145098	0.145098	0.145098
	0.000000	0.000000	0.000000

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
