function map = set1(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

c = [
	0.894118	0.101961	0.109804
	0.215686	0.494118	0.721569
	0.301961	0.686275	0.290196
	0.596078	0.305882	0.639216
	1.000000	0.498039	0.000000
	1.000000	1.000000	0.200000
	0.650980	0.337255	0.156863
	0.968627	0.505882	0.749020
	0.600000	0.600000	0.600000

    ];

map = c(rem(0:m-1,size(c,1))+1,:);

end
