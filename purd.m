function map = purd(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	0.968627	0.956863	0.976471
	0.905882	0.882353	0.937255
	0.831373	0.725490	0.854902
	0.788235	0.580392	0.780392
	0.874510	0.396078	0.690196
	0.905882	0.160784	0.541176
	0.807843	0.070588	0.337255
	0.596078	0.000000	0.262745
	0.403922	0.000000	0.121569

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
