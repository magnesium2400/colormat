function map = ylgnbu(m)
if nargin < 1
   f = get(groot,'CurrentFigure');
   if isempty(f)
      m = size(get(groot,'DefaultFigureColormap'),1);
   else
      m = size(f.Colormap,1);
   end
end

values = [
	1.000000	1.000000	0.850980
	0.929412	0.972549	0.694118
	0.780392	0.913725	0.705882
	0.498039	0.803922	0.733333
	0.254902	0.713725	0.768627
	0.113725	0.568627	0.752941
	0.133333	0.368627	0.658824
	0.145098	0.203922	0.580392
	0.031373	0.113725	0.345098

    ];

P = size(values,1);
map = interp1(1:size(values,1), values, linspace(1,P,m), 'linear');

end
