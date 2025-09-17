function map = purples(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	0.988235	0.984314	0.992157
	0.937255	0.929412	0.960784
	0.854902	0.854902	0.921569
	0.737255	0.741176	0.862745
	0.619608	0.603922	0.784314
	0.501961	0.490196	0.729412
	0.415686	0.317647	0.639216
	0.329412	0.152941	0.560784
	0.247059	0.000000	0.490196

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
