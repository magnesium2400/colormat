function map = rdpu(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	1.000000	0.968627	0.952941
	0.992157	0.878431	0.866667
	0.988235	0.772549	0.752941
	0.980392	0.623529	0.709804
	0.968627	0.407843	0.631373
	0.866667	0.203922	0.592157
	0.682353	0.003922	0.494118
	0.478431	0.003922	0.466667
	0.286275	0.000000	0.415686

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
