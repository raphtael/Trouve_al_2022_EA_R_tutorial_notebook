# Beta-binomial model used to infer the sample size of an offshore inspection (n1).
  stan_beta_binomial <-"     
    data {
      //Number of crates in the dataset
        int n_cons; // Number of consignments  
      //Variables in the model
        int k[n_cons]; // Observed number of infested samples for consignment j
        int n2; // Sample size of the onshore inspection
      // Values of a and b Beta distribution parameters, estimated from past data
        // Note that instead of using fixed values for a and b, we could use prior distributions (e.g., if we have uncertainties in the estimates)
        real a;
        real b;
      // Priors on n1, samlpe size of the offshore inspection
        real prior_expected_n1; // Prior n1 mean    
    }
    parameters { //Define the sampling space
      //Parameters
        real <lower = 0> n1; // Sample size of the offshore inspection
    }
    transformed parameters{
    } 
    model {
      //Priors
        n1 ~ exponential(1.0 / prior_expected_n1); // Exponential prior distribution, mean of expected n1
      //Likelihood        
        k ~ beta_binomial(n2, a, b + n1);         
    }
    generated quantities {
      // Simulate from prior parameter
        real <lower=0> n1_prior;
        n1_prior = exponential_rng(1.0 / prior_expected_n1);
    }
  "
