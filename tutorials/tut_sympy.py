import sympy as sym
import numpy as np

print(np.sqrt(2))
print(sym.sqrt(2))

x=sym.Symbol('x')
expr=sym.integrate(x**3,x)
print(expr)
print(sym.diff(x**3,x))

expr=x**2+2
val=expr.subs(x,1)
print(f"x->{1} {expr}->{val}")

expr=(x**2+4*x+3)/(x+1)
print(expr)
expr=sym.simplify(expr)
print(expr)

expr=x**2
f=sym.lambdify(x, expr) 
print(f"x->{2} {expr}={f(2)}")

print(sym.expand((x+2)**2))
print(sym.factor(x**2+2*x+1))
s=sym.Symbol('s')
print(sym.collect((s+1)*(s+3),s))

expr=s**2+4*s+3
sol=sym.solve(expr)
print(expr)
print(sol)

t=sym.Symbol('t')
f=sym.symbols('f', cls=sym.Function) 
expr=sym.diff(f(t))+3*f(t)
sol=sym.dsolve(expr)
print(expr)
print(sol)
print(sol.rhs)
