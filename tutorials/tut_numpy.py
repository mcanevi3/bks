import numpy as np

vec = np.array([1, 2, 3, 4])
print(vec)
print(type(vec))
print(vec[0])
print(vec[0:2])
print(vec.shape)
for x in vec:
  print(x)
x = np.where(vec == 4)
print(np.sort(vec))

skalar = np.array(51)
print(skalar)
print(skalar.shape)
print(skalar.ndim)

matris = np.array([[1, 2], [-3,-4]])
print(matris)
print(matris[0,0])
print(matris.shape)
for x in matris:
  for y in x:
    print(y)

x = np.random.randint(100)
print(x)
x = np.random.randint(100, size=(3, 5))
print(x)

t=np.arange(0,3,1)
x=np.zeros_like(t)
u=np.ones((2, 1))
print(np.identity(3))
print(np.linspace(0,3,11))

A=np.array([[1,2],[-3,-4]])
lambd=np.linalg.eig(A)
print(lambd)

print(np.sin(30))
y=np.sin(30*np.pi/180)
print(y)
print(np.round(y,3))

print(np.exp(-2))
print(np.sqrt(9))

vec = np.array([1, 2, 3, 4])
print(np.min(vec))
i=np.argmin(vec)
print(f"{i}->{vec[i]}")
