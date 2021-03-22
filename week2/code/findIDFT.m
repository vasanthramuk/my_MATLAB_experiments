function result = findIDFT(X)
%FINDIDFT This function calculates the IDFT of any n point sequence

    N = length(X);
    result(1:length(X)) = 0;        %it stores the DFT of x
    
    for n=0:N-1             %for iterating differant values of n
        temp = 0;           %This is where the x(n) will be stored
        for k=0:N-1         %for iterating differant values of k for
                            %the given n
            temp = temp + X(k+1)*power(twiddleFactorInverse(N),k*n);
        end
        result(n+1) = (1/N)*temp;
    end
end

function result = twiddleFactorInverse(N)

%This function returns the twiddle factor/ basis function / N th root of
%unity
    result = exp((j*2*pi)/N);
end