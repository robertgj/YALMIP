function tests = test_operator_maxlocation
tests = functiontests(localfunctions);

function test1(dummy)
% Test for feature #313
y = (1:5)';
x = intvar(5,1);
[val,loc] = max(x);
sol = optimize([sort(x) == y, loc == 5],x'*x)
assert(sol.problem == 0)
assert(abs(value(x(5))-5) <= 1e-4);

[val,loc] = min(x);
sol = optimize([sort(x) == y, loc == 5],x'*x)
assert(sol.problem == 0)
assert(abs(value(x(5))-1) <= 1e-4);
