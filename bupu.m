function map = bupu(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	0.968627	0.988235	0.992157
	0.878431	0.925490	0.956863
	0.749020	0.827451	0.901961
	0.619608	0.737255	0.854902
	0.549020	0.588235	0.776471
	0.549020	0.419608	0.694118
	0.533333	0.254902	0.615686
	0.505882	0.058824	0.486275
	0.301961	0.000000	0.294118

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
