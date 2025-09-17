function map = pubugn(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	1.000000	0.968627	0.984314
	0.925490	0.886275	0.941176
	0.815686	0.819608	0.901961
	0.650980	0.741176	0.858824
	0.403922	0.662745	0.811765
	0.211765	0.564706	0.752941
	0.007843	0.505882	0.541176
	0.003922	0.423529	0.349020
	0.003922	0.274510	0.211765

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
