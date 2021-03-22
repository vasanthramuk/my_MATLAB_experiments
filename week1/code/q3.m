%x[n] = = e(−0.1+j0.3)n ; -10 ≤ n ≤ 10,


n=[-10:10];
xn = exp((-0.1+0.3j)*n);

sgtitle("x[n] = = e(−0.1+j0.3)n");
subplot(2,2,1);stem(n,real(xn));
xlabel("n");ylabel("Re(x[n])");title("Re{x[n]}");

subplot(2,2,2);stem(n,imag(xn));
xlabel("n");ylabel("Im(x[n])");title("Im{x[n]}");

subplot(2,2,3);stem(n,abs(xn));
xlabel("n");ylabel("|x[n]|");title("|x[n]|");

subplot(2,2,4);stem(n,angle(xn));
xlabel("n");ylabel("<(x[n]");title("<(x[n])");