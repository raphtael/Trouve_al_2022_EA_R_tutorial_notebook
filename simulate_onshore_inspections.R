# Simulate an onshore inspection. 
  # n_cons: number of consignments inspected. 
  # a and b: parameters from the Beta-Binomial distribution.
  # n2: sample size of the onshore inspection.
  # Requires the emdbook package.
  simulate_onshore_inspections <- function(n_cons, a, b, n2){
    k <- emdbook::rbetabinom(n = n_cons, shape1 = a, shape2 = b, size = n2)  # Find k infested units onshore
    return(k)
  }