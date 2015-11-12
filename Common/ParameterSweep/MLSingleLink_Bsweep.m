%% Dynamics of a Single Link
% This example illustrates how to run and control a Simulink model
% from a script, and how to capture the results of the simulation for
% post-processing and visualization in MATLAB.
%% Open the single link Simulink model
open_system('SLSingleLink_End');
%% Run a parameter sweep and plot the results
% Run the dynamic simulation with different values for the rotational
% viscous friction coefficient: b = [0.5, 0.6, 0.7, 0.8, 0.9, 1, 1.1, 1.2]
%%
% *Set up the viscous friction coefficient values in vector form*
BSweep = .5:.1:1.5;
%%
% *Run multiple simulations using a for-loop*
figure
map = jet(length(BSweep));
legend_array = cell(length(BSweep),1);
hold on
for i = 1:length(BSweep)
    b = BSweep(i);
    [t,x,y] = sim('SLSingleLink_End');
    plot(t,y,'Color',map(i,:));
    axis tight
    legend_array{i} = ['b = ' num2str(b) ' N*m*sec/rad'];
end
legend(legend_array, 'Location', 'NorthEast')
hold off
title('Single link response for different values of b')
xlabel('time (sec)');
ylabel('angle (rad)');
box on
grid on