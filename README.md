This repository contains the R tutorial notebook and R scripts accompanying the manuscript entitled "Assessing the quality of offshore Binomial sampling biosecurity inspections using onshore inspections" by Trouve et al. (2022), published in Ecological Applications.

# File list

* fit_stan_model.R
 
* prop_n1_below_above_threshold.R

* simulate_onshore_inspections.R

* stan_beta_binomial.R

* Trouve_al_2021_EA_R_notebook.html

* Trouve_al_2021_EA_R_notebook.Rmd

# File description
* Trouve_al_2021_EA_R_notebook.Rmd – This is the main file of the folder. The file is a notebook showing how to reproduce the manuscript’s computations in R. Specifically, the notebook shows how to 1) calibrate a Beta-Binomial reference distribution from past inspection data on the pathway and run a posterior predictive check (similar to Fig.3 in the manuscript); 2) compute the posterior distribution of n1 for different number of infested samples found in a single onshore inspection (Fig.2 in the manuscript); 3) compute how many infested samples onshore in a single inspection are sufficient to reject the presence of an offshore inspection (Fig.4 in the manuscript); 4) compute how many successive inspections are necessary to reject or accept the presence of an offshore inspection in practice (statistical power analysis, Figs.5 and 6 in the manuscript). The notebook can be run from Rstudio (we used Rstudio with R version 4.0.2) using the `knit to html’ button. The notebook requires installing the `ggplot’, `data.table’, `emdbook’, `rstan’, and `bang’ packages in R.

* Trouve_al_2021_EA_R_notebook.html – Notebook output in an html format. 

* fit_stan_model.R – This function is called by the notebook file. Function fitting a Stan model inferring the posterior distribution of n1. The functions contains several arguments:

  - model: Stan model to fit, expressed as a string.
  
  - n2: Sample size of the onshore inspection.
  
  - a and b: parameters from the Beta-Binomial distribution.
  
  - k: Vector for the number of infested units found in each onshore inspections.
  
  - prior_expected_n1: Expected offshore inspection sample size (usually 600).
  
  - iter = 6000, warmup = 1000, chains = 10, show_messages = FALSE, adapt_delta = 0.9. rstan control parameters for the model fit.

* prop_n1_below_above_threshold.R - This function is called by the notebook file. Function to compute the proportion of posterior distribution of n1 that is above and below certain threshold values. Function arguments:
 
  - n1: Posterior distribution of n1. Taken from a Stan model fit.
  
  - below_threshold: Compute how much mass of the posterior distribution of n1 is below this threshold.
  
  - above_threshold: Compute how much mass of the posterior distribution of n1 is above this threshold.

* simulate_onshore_inspections.R - This function is called by the notebook file. Simulate an onshore inspection. Function arguments:
  
  - n_cons: number of consignments inspected. 
  
  - a and b: parameters from the Beta-Binomial distribution.
  
  - n2: sample size of the onshore inspection.
  
  - Requires the emdbook package.

* stan_beta_binomial.R - This function is called by the notebook file. Simulate an onshore inspection. Stan code for the Beta-binomial model used to infer the sample size of an offshore inspection (n1).

