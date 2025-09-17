function map = rdgy(varargin)
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
	0.403922	0.000000	0.121569
	0.698039	0.094118	0.168627
	0.839216	0.376471	0.301961
	0.956863	0.647059	0.509804
	0.992157	0.858824	0.780392
	1.000000	1.000000	1.000000
	0.878431	0.878431	0.878431
	0.729412	0.729412	0.729412
	0.529412	0.529412	0.529412
	0.301961	0.301961	0.301961
	0.101961	0.101961	0.101961

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
