function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
errorFinal = 1000;

for i = 1:8
    for j = 1:8
        switch i
            case 1
                C = 0.01;
            case 2
                C = 0.03;
            case 3
                C = 0.1;
            case 4
                C = 0.3;
            case 5
                C = 1;
            case 6
                C = 3;
            case 7
                C = 10;
            case 8
                C = 30;
        end
        
        switch j
            case 1
                sigma = 0.01;
            case 2
                sigma = 0.03;
            case 3
                sigma = 0.1;
            case 4
                sigma = 0.3;
            case 5
                sigma = 1;
            case 6
                sigma = 3;
            case 7
                sigma = 10;
            case 8
                sigma = 30;
        end
        
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        if error < errorFinal
            errorFinal = error;
            CFinal = C;
            sigmaFinal = sigma;
        end
    end
end


C = CFinal;
sigma = sigmaFinal;


% =========================================================================

end
