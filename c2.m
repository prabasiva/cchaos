function [r, c] = c2(x, d, m, n, s, p, r, q)
% C2 function calculates the correlation sum from a scalar time
%  series after reconstructing its phase space using delay coordinates
%  It uses Euclidean distances!
%
% CALL: [r, c] = c2(x, d, m, n, s, p, r);
%       If no output is requested it will just plot the results
%
% INPUT:
%   x -- scalar time series
%   d -- embedding dimension
%   m -- delay parameter
%   n -- number of points to use in phase space
%   s -- number of bins (length-scale partitions) to use
%   p -- (optional) supply 0 to NOT remove temporal correlations
%        or number of points to remove. The default is p = d*m.
%        NOTE: only need to remove these correlations for the continuous 
%        flow data!
%   r -- (optional) bin (ball) sizes to use for binning
%        if using the output of this program (r), then input r = 10.^r
%   q -- (optional) only supply if instead of removing temporal
%        correlations you wish to randomly populate attractor with q sample
%        points (thus, this will ignore p input if provided, & use max n!)
%
% OUTPUT:
%   r -- log_10 of ball sizes
%   c -- lod_10 of correlation sum
%
% copyright by David Chelidze 3/27/2002
% revised by DC 5/31/2002 & 6/12/2002 & 10/2/2002 & 10/30/2002
% & 11/04/2005 & 3/3/3009 & 11/4-21/2013 by DC
 
if nargin < 5
    error('Error: Needs at least five input variables!')
end
 
if min(size(x)) ~= 1
   error('Error: First input should be a vector of scalar data points.')
else % normalize the input time series
    x = x(:)' - mean(x); % make it zero mean
    x = x/std(x); % make it unit variance
end
 
nm = length(x) - (d-1)*m; % maximum number of reconstructed points possible
if isempty(n) % use max
    n = nm; 
elseif n > nm % use max possible and notify
    fprintf('WARNING: Max number of embedded vectors exceeded\n')
    fprintf('ACTION:  Continuing with max number of vectors possible!\n')
    n = nm;
end
 
if nargin < 6 || isempty(p) % remove temporal correlations of this length
    p = d*m; % still open for debate, may want to use different length
end
 
%% reconstruct the phase space to analyze
if nargin == 8 && isempty(q) < 1 % randomly populate attractor w/ p points 
    indx = unique(ceil((n-1)*rand(1,q))); % random indexes of points
    n = size(indx,2); % new number of phase space points to use
    y = zeros(d,n); % initialize
    for i = 0:d-1 % randomly populated reconstructed phase space
        y(i+1,:) = x(indx+i*m);
    end
    p = 0; % do not need to remove temporal correlations 
else % use the whole phase space
    y = zeros(d,n); 
    for i = 0:d-1 % reconstructed phase space
        y(i+1,:) = x((1:n)+i*m);
    end
end
 
if nargin < 7 || isempty(r) % specify binning distances
    % first estimate the minimum ball (bin) size to use
    dmin = 2*d*(mean(diff(unique(abs( y(1,:) - y(2,:) ))))); 
%     dmax = d*( max(y(1,:)) - min(y(1,:)) ); % now estimate maximum ball size
    dmax = ( max(y(1,:)) - min(y(1,:)) ); % now estimate maximum ball size
    % uniformly distribute binning on a log_10 scale 
    r = [0 10.^linspace(2*log10(dmin), 2*log10(dmax), s)];                                  
else % use user provided distances squared
    s = length(r);
    r = [0 r(:).^2']; 
end
 
%% calculate the correlation sum
c = zeros(1, s+1); % initialize the correlation sum array
for i = 1:n-p-1 % for every point in the reconstructed phase space
    dist = 0;
    for k = 1:d % calculate distances squared to other points
        dist = dist + (y(k, i+p+1:n) - y(k, i)).^2; % distances squared
    end
    tmp = histc(dist, r); % get the histogram of all distances squared
    c = c + tmp; % add up all the histograms
end
if c(end) ~= 0 % just to make sure we do not miss any points
    c(end-1) = c(end-1) + c(end);
end
c = log10(2*cumsum(c(1:end-1))/((n-p)*(n-p-1))); % log_10 of corr-sum
r = log10(r(2:end))/2; % log_10 of distances
% discard irrelevant points
indx = c>-inf & c<0;
c = c(indx);
r = r(indx);
 
if nargout == 0 % plot the results
   % figure
    plot(r,c,'.-')
    set(gca,'fontsize',12)
    xlabel('$\langle \log_{10}(\epsilon)\rangle$','Interpreter','Latex',...
        'FontSize',14)
    ylabel('$\log_{10}(C(\epsilon))$','Interpreter','Latex','FontSize',14)
    title('\textsf{Correlation Sum}','Interpreter','Latex','FontSize',14)
end