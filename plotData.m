function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

figure; % open a new figure window

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the training data into a figure using the 
%               "figure" and "plot" commands. Set the axes labels using
%               the "xlabel" and "ylabel" commands. Assume the 
%               population and revenue data have been passed in
%               as the x and y arguments of this function.
%
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

data=load('ex1data1.txt');
X=data(:,1); y = data(:,2);


%m=length(X);
num_iters = 1500;             % Iterations
theta = zeros(2,1);           % Initial Weight
alpha = 0.01;                 % learning rate

plot(X,y, 'rx', 'Markersize',10);
ylabel('Profit in $10,000s');
xlabel('Population of City in 10,000s');


% Adding One feature into X
m = length(y);
X = [ones(m, 1), data(:,1)]; 

% Cost_function
J = computeCost(X, y, theta);

% gradient_Descent
[theta, J_history]=  gradientDescent(X, y, theta, alpha, num_iters);


% Plotting linear regression
hold on;
plot(X(:,2), X * theta, '-');
legend('Training data', 'Linear regression');
hold off;

% % initialize J vals to a matrix of 0's
% J_vals = zeros(length(theta0_vals), length(theta1_vals));
% % Fill out J vals
% for i = 1:length(theta0_vals)
%    for j = 1:length(theta1_vals)
%      t = [theta0 vals(i); theta1 vals(j)];
%    J_vals(i,j) = computeCost(x, y, t);
%    end
% end
% ============================================================

end
