function map = oranges(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	1.000000	0.960784	0.921569
	0.996078	0.901961	0.807843
	0.992157	0.815686	0.635294
	0.992157	0.682353	0.419608
	0.992157	0.552941	0.235294
	0.945098	0.411765	0.074510
	0.850980	0.282353	0.003922
	0.650980	0.211765	0.011765
	0.498039	0.152941	0.015686

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
