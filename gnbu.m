function map = gnbu(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	0.968627	0.988235	0.941176
	0.878431	0.952941	0.858824
	0.800000	0.921569	0.772549
	0.658824	0.866667	0.709804
	0.482353	0.800000	0.768627
	0.305882	0.701961	0.827451
	0.168627	0.549020	0.745098
	0.031373	0.407843	0.674510
	0.031373	0.250980	0.505882

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
