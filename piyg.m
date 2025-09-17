function map = piyg(varargin)
%% Prelims
ip = inputParser;
ip.addOptional('n', size(get(groot,'DefaultFigureColormap'),1));
ip.addParameter('center', 0);
ip.addParameter('clims', [-1 1]);
ip.addParameter('mode', 'trimmed', @(x) ismember(x, {'trimmed', 'complete'}));
ip.addParameter('Parent', get(groot,'CurrentFigure'));

ip.parse(varargin{:});
n = ip.Results.n; 
clims = ip.Results.clims;
mode = ip.Results.mode; autoscaleColors = strcmpi(mode, 'trimmed');
Parent = ip.Results.Parent();


%% Sort out inputs (n, clim, colors)
ipiud = @(fieldname) any(strcmp( ip.UsingDefaults , fieldname ));
if ipiud('n')     && ~isempty(Parent) && isprop(Parent, 'Colormap'); n = height(get(Parent, 'Colormap')); end
if ipiud('clims') && ~isempty(Parent) && isprop(Parent, 'CLim');     clims = get(Parent, 'CLim');         end
clims = clims - ip.Results.center;

values = [...
	0.556863	0.003922	0.321569
	0.772549	0.105882	0.490196
	0.870588	0.466667	0.682353
	0.945098	0.713725	0.854902
	0.992157	0.878431	0.937255
	0.968627	0.968627	0.968627
	0.901961	0.960784	0.815686
	0.721569	0.882353	0.525490
	0.498039	0.737255	0.254902
	0.301961	0.572549	0.129412
	0.152941	0.392157	0.098039

    ];
m = ceil(size(values,1)/2);


%% Calculations
if (clims(1) < 0) && (clims(2) > 0)

    r = abs(clims(1)) / clims(2); % Ratio of neg to pos
    neglen = round( n*r/(r+1) ) + (r<1); % favour the smaller half
    poslen = n - neglen + 1;

    % Just negative
    neglim = clims(1) - (autoscaleColors && r < 1)*sum(clims); % clims(1) or -clims(2)
    negmap = interp1( linspace( neglim,0,m), values( 1:m           , : ), linspace(clims(1),0,neglen) );

    % Just positive
    poslim = clims(2) - (autoscaleColors && r > 1)*sum(clims); % clims(2) or -clims(1)
    posmap = interp1( linspace( 0,poslim,m), values( (end-m+1):end , : ), linspace(0,clims(2),poslen) );

    % And put 'em together
    map = [negmap; posmap(2:end,:)];

else
    if clims(1) >= 0; map = values( (end-m+1):end , : ); % Just positive
    else; map = values(1:m,:); end % Just negative
    map = interp1(linspace(0, 1, m), map, linspace(0, 1, n));
end

map = min(max(map, 0), 1);


end
