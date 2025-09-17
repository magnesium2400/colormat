function map = greens(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	0.968627	0.988235	0.960784
	0.898039	0.960784	0.878431
	0.780392	0.913725	0.752941
	0.631373	0.850980	0.607843
	0.454902	0.768627	0.462745
	0.254902	0.670588	0.364706
	0.137255	0.545098	0.270588
	0.000000	0.427451	0.172549
	0.000000	0.266667	0.105882

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
