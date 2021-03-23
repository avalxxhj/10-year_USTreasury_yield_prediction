%estimate dynamics (AR(1)) of the 10-year yield
S=[1 idx(1)]; %full sample and since 1994
betas=nan(length(S),2);
for s=1:length(S)
 x=[data(S(s):end-1,2).^0 data(S(s):end-1,2)];
 betas(s,:)=x\data(S(s)+1:end,2);
end
%forecasts
t=1:120;
F=nan(length(S),length(t));
for s=1:length(S)
 F(s,:)=data(end,2)*betas(s,2).^t + betas(s,1)*((1-
betas(s,2).^t)/(1-betas(s,2)));
end 