H = [.6 .5 .3 .2 .4;
.3 .7 .4 .1 .9;
.1 1 0 .1 .3;
.4 .3 .6 .2 .1;
.1 .2 .2 .6 .5];

s = [1 2 3 4 5]';

 [U S V] = svd(H);

Dig = U'*H*V;

s' = V'*s;
x' = D*s';
x = U*x';

x'  = H*s;

x_noise = awgn(x,40);

s_recov = V*inv(D)*U'*x_noise;

s_recov = inv(H)* x_noise;