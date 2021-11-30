# Function fitting a Stan model inferring the posterior distribution of n1
  # model: Stan model to fit, expressed as a string.
  # n2: Sample size of the onshore inspection
  # a and b: parameters from the Beta-Binomial distribution.
  # k: Vector for the number of infested units found in each onshore inspections.
  # prior_expected_n1: Expected offshore inspection sample size (usually 600)
  # iter = 6000, warmup = 1000, chains = 10, show_messages = FALSE, adapt_delta = 0.9. rstan control parameters for the model fit.
  fit_stan_model <- function(model = stan_beta_binomial, n2, a, b, k, prior_expected_n1, iter = 6000, warmup = 1000, chains = 10, show_messages = FALSE, adapt_delta = 0.9){
    data_for_stan <- list(n_cons = length(k), n2 = n2, a = a, b = b, k = as.array(k), prior_expected_n1 = prior_expected_n1)
    stan_fit <- sampling(object = model, 
                         data = data_for_stan, 
                         iter = iter, 
                         warmup = warmup, 
                         chains = chains, 
                         show_messages = show_messages, 
                         control = list(adapt_delta = adapt_delta), 
                         refresh = 0,
                         verbose = FALSE)
    n1_posterior <- as.data.frame(stan_fit, pars = 'n1')
    return(n1_posterior)
  }  
  
                                                       