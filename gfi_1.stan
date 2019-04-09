functions{ 
  real jac_log(real mu,vector t){
  vector[num_elements(t)] jac;
  
  for(i in 1:num_elements(t)){
  jac[i]=fabs(1+(1.5)*((t[i]-mu)/mu));
  }
  return log(sum(jac));
  
  }

}
data {
    int<lower=1> N;  // number of observations
    vector [N] Y;
}
parameters {
    real<lower=0> mu;
}

model {
mu~jac(Y);
Y~normal(mu,mu^(.75));
} 
