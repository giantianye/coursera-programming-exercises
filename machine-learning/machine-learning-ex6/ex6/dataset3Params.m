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



lowest_error = 1e50;
lowest_error_C = 0;
lowest_error_sigma = 0;

for C_cand = [0.01 0.03 0.1 0.3 1 3 10 30],
	for sigma_cand = [0.01 0.03 0.1 0.3 1 3 10 30],
		model = svmTrain(X, y, C_cand, @(x1, x2) gaussianKernel(x1, x2, sigma_cand));
		predictions = svmPredict(model, Xval);
		pred_error = mean(double(predictions ~= yval));
		if pred_error < lowest_error,
			lowest_error = pred_error;
			lowest_error_C = C_cand;
			lowest_error_sigma = sigma_cand;
		end
	end
end

C = lowest_error_C;
sigma = lowest_error_sigma;

% =========================================================================

end
