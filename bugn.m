function map = bugn(m)
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
	0.898039	0.960784	0.976471
	0.800000	0.925490	0.901961
	0.600000	0.847059	0.788235
	0.400000	0.760784	0.643137
	0.254902	0.682353	0.462745
	0.137255	0.545098	0.270588
	0.000000	0.427451	0.172549
	0.000000	0.266667	0.105882

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
