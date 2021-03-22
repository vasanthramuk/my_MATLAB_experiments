x = :;
signal = zeros(1, 10);
signal(1) = 1;

stem(x,signal);
xlabel("n");
ylabel("x[n]");
title("Unit Impulse Signal");