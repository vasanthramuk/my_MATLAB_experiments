%x[n] = n[u[n] - u[n-10]] + 10𝐞−𝟎.𝟑(𝐧−𝟏𝟎) [u[n] - u[n-10]]; 0≤n≤20
clc
clear all
n = [-20:20];

for i=1:length(n)
    if(n(i) >= 0)
        un(i)=1;
    else
        un(i)=0;
    end
end

for i=1:length(n)
    if(n(i) >= 10)
        unm10(i)=1;
    else
        unm10(i)=0;
    end
end

for i=1:length(n)
    part1(i) = n(i)*(un(i) - unm10(i))
end

for i=1:length(n)
    part2(i) = 10*exp(-0.3*(n(i)-10))*(un(i)-unm10(i));
end

yn = part1 + part2;

sgtitle("x[n] = n[u[n] - u[n-10]] + 10𝐞−𝟎.𝟑(𝐧−𝟏𝟎) [u[n] - u[n-10]]")

subplot(2,3,1); stem(n,un);
xlabel("n");ylabel("u[n]");title("u[n]");

subplot(2,3,2); stem(n,unm10);
xlabel("n");ylabel("u[n-10]");title("u[n-10]");

subplot(2,3,3); stem(n,un-unm10);
xlabel("n");ylabel("u[n]-u[n-10]");title("u[n]-u[n-10]");

subplot(2,3,4); stem(n,part1);
xlabel("n");ylabel("part1");title("n[u[n] - u[n-10]]");

subplot(2,3,5); stem(n,part2);
xlabel("n");ylabel("part2");title("10𝐞−𝟎.𝟑(𝐧−𝟏𝟎)*[u[n] - u[n-10]]");

subplot(2,3,6); stem(n,yn);
xlabel("n");ylabel("y[n]");title("y[n]");