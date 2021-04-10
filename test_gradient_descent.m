function tests = test_gradient_descent
%TEST_GRADIENT_DESCENT Summary of this function goes here
%   Detailed explanation goes here
tests = functiontests(localfunctions);

end


function setup(testCase)

end

function teardown(testCase)

end

function test_1D_cos(testCase)
f = @(x) cos(x)+1;
x = gradient_descent(f, 'x0', 0.5, 'alpha', 0.4, 'tol', 1e-10, 'verbose', false);

assert(abs(f(x)) < 1e-6);

end


function test_1D_quad(testCase)
f = @(x) (x-1)^2;
x = gradient_descent(f, 'x0', 0.5, 'alpha', 0.4, 'tol', 1e-10, 'verbose', false);

assert(abs(f(x)) < 1e-6);

end

function test_2D_quad(testCase)
f = @(x) (x(1)-1)^2 * (x(2)-3)^2;
x = gradient_descent(f, 'x0', [0.5 0.5]', 'alpha', 0.1, 'tol', 1e-10, 'verbose', false);

assert(abs(f(x)) < 1e-6);

end
