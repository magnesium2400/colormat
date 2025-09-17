function map = dark2(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

c = [
	0.105882	0.619608	0.466667
	0.850980	0.372549	0.007843
	0.458824	0.439216	0.701961
	0.905882	0.160784	0.541176
	0.400000	0.650980	0.117647
	0.901961	0.670588	0.007843
	0.650980	0.462745	0.113725
	0.400000	0.400000	0.400000

    ];

map = c(rem(0:m-1,size(c,1))+1,:);

end
