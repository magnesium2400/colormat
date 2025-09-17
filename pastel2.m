function map = pastel2(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

c = [
	0.701961	0.886275	0.803922
	0.992157	0.803922	0.674510
	0.796078	0.835294	0.909804
	0.956863	0.792157	0.894118
	0.901961	0.960784	0.788235
	1.000000	0.949020	0.682353
	0.945098	0.886275	0.800000
	0.800000	0.800000	0.800000

    ];

map = c(rem(0:m-1,size(c,1))+1,:);

end
