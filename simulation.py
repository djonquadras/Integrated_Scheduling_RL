# Libraries
import simpy
import sklearn as skl
import matplotlib as mpl
import time 
import random as rd
import utilsDjonathan as dj

# Create the environment
env = simpy.Environment()

# Random seed to replicable experiments
rd.seed(123)

# Production Orders
dj.order(code = 111, steelType = "A", startDate=0, dueDate=10, demand=50)


