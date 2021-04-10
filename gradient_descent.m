function x = gradient_descent(cost_fun, varargin)
% gradient descent
%
%

p = inputParser;
p.addRequired('cost_fun');
p.addParameter('x0', 0.5);
p.addParameter('alpha', 0.8);
p.addParameter('max_dx', 1e-6);
p.addParameter('max_iter', 100);
p.addParameter('tol', 1e-6);
p.addParameter('verbose', true);

p.parse(cost_fun, varargin{:});

x0 = p.Results.x0;
alpha = p.Results.alpha;
max_dx = p.Results.max_dx;
max_iter = p.Results.max_iter;
tol = p.Results.tol;
verbose = p.Results.verbose;


x = x0;

nx = length(x);

for iter = 1:max_iter
    err = cost_fun(x);
    if (abs(err) < tol)
        break
    end
    
    m = zeros(nx, 1);
    for ix = 1:nx
        mask = zeros(nx, 1);
        mask(ix) = 1;
        
        dy = cost_fun(x+mask*max_dx) - cost_fun(x-mask*max_dx);
        dx = 2*max_dx;
        m(ix) = dy/dx;

    end
    x = x - alpha * m;
    
    if verbose
        fprintf('iter %d, err: %.6f, m: %.6f\n', iter, err, dot(m, m));
    end
end

end