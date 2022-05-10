# Libraries
import simpy
import sklearn as skl
import matplotlib as mpl
import time 
import random as rd
import utils as dj
import weg_process as weg

# Create the environment
env = simpy.Environment()

# Random seed to replicable experiments
rd.seed(123)

# Production Orders
dj.order(code = 111, steelType = "A", startDate=0, dueDate=10, demand=50)

# The jobs

wegJob = weg()

def jobs(env, wegJob, order):
    "The jobs process"
    with wegJob.stampingMachine.request() as req:
        yield req
        yield env.process(wegJob.stamping(order))

    if order.needStove:
        yield env.process(wegJob.stove())


    


