functions{ 
  real genfid_log(vector t,real mu){
  vector[num_elements(t)] jac;
  vector[num_elements(t)] log_likl;
 for(i in 1:num_elements(t)){
  jac[i]=fabs(1+(1.5)*((t[i]-mu)/mu));
  log_likl[i]=(t[i]-mu)^2/(2*mu^(1.5))+(0.75)*log(mu);
  }
  return log(sum(jac))-sum(log_likl);
    }
}
data {
    int<lower=1> N; 
    vector [N] Y;
}
parameters {
 real<lower=0> mu;
}
model {
Y~genfid(mu);
} 

