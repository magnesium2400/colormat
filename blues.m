function map = blues(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	0.968627	0.984314	1.000000
	0.870588	0.921569	0.968627
	0.776471	0.858824	0.937255
	0.619608	0.792157	0.882353
	0.419608	0.682353	0.839216
	0.258824	0.572549	0.776471
	0.129412	0.443137	0.709804
	0.031373	0.317647	0.611765
	0.031373	0.188235	0.419608

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
