function result = findDFT(x)

%This function gets any point sequence as input vector
%and returns its DFT as output vector

    N = length(x);
    result(1:length(x)) = 0;        %it stores the DFT of x
    
    for k=0:N-1             %for iterating differant values of k
        temp = 0;           %This is where the X(k) will be stored
        for n=0:N-1         %for iterating differant values of n for
                            %the given k
            temp = temp + x(n+1)*power(twiddleFactor(N),k*n);
        end
        result(k+1) = temp;
    end
end



function result = twiddleFactor(N)

%This function returns the twiddle factor/ basis function / N th root of
%unity
    result = exp((-j*2*pi)/N);
end