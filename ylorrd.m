function map = ylorrd(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	1.000000	1.000000	0.800000
	1.000000	0.929412	0.627451
	0.996078	0.850980	0.462745
	0.996078	0.698039	0.298039
	0.992157	0.552941	0.235294
	0.988235	0.305882	0.164706
	0.890196	0.101961	0.109804
	0.741176	0.000000	0.149020
	0.501961	0.000000	0.149020

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
