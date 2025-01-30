import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import tbcontrol
import control
############################
# q1
############################
def fun_q1():
    T=0.2
    den=[1 0.3 4.22 -3.58 -0.4]
    poles=roots(den)
    Gz=tf(1,den,T)

fun_q1()