library(simmer)
library(simmer.plot)

# Instantiate a new simulation environment
set.seed(42)

env <- simmer("SuperDuperSim")

# Set-up a simple trajectory

patient <- trajectory("patients' path") %>%
  ## add an intake activity 
  seize("nurse", 1) %>%
  timeout(function() rnorm(1, 15)) %>%
  release("nurse", 1) %>%
  ## add a consultation activity
  seize("doctor", 1) %>%
  timeout(function() rnorm(1, 20)) %>%
  release("doctor", 1) %>%
  ## add a planning activity
  seize("administration", 1) %>%
  timeout(function() rnorm(1, 5)) %>%
  release("administration", 1)


# Add resources and generator

env %>%
  add_resource("nurse", 1) %>%
  add_resource("doctor", 2) %>%
  add_resource("administration", 1) %>%
  add_generator("patient", patient, function() rnorm(1, 10, 2))



# Run simulation

env %>% 
  run(80) %>% 
  wrap()

resources <- get_mon_resources(env)
plot(resources, metric = "usage", c("nurse", "doctor"), items = "server")
plot(resources, metric = "utilization")
plot(get_mon_resources(env[[6]]), metric = "usage", "doctor", items = "server", steps = TRUE)
