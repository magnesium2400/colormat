function map = reds(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	1.000000	0.960784	0.941176
	0.996078	0.878431	0.823529
	0.988235	0.733333	0.631373
	0.988235	0.572549	0.447059
	0.984314	0.415686	0.290196
	0.937255	0.231373	0.172549
	0.796078	0.094118	0.113725
	0.647059	0.058824	0.082353
	0.403922	0.000000	0.050980

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
