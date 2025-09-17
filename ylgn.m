function map = ylgn(m)
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
	0.968627	0.988235	0.725490
	0.850980	0.941176	0.639216
	0.678431	0.866667	0.556863
	0.470588	0.776471	0.474510
	0.254902	0.670588	0.364706
	0.137255	0.517647	0.262745
	0.000000	0.407843	0.215686
	0.000000	0.270588	0.160784

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
