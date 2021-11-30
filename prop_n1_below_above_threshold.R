# Function to compute the proportion of posterior distribution of n1 that is above and below certain threshold values    
  # n1: Posterior distribution of n1. Taken from a Stan model fit.
  # below_threshold: Compute how much mass of the posterior distribution of n1 is below this threshold.
  # above_threshold: Compute how much mass of the posterior distribution of n1 is above this threshold.
  prop_n1_below_above_threshold <- function(n1, below_threshold = prior_expected_n1, above_threshold = 400){
    prop_below <- sum(n1 < below_threshold) / length(n1)
    prop_above <- sum(n1 > above_threshold) / length(n1)
    return(cbind.data.frame(prop_below, prop_above))
  }