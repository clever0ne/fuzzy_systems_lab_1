clc; clear; close all;

n = 25;
x1min =  0;
x1max = pi;
x2min = -1;
x2max =  1;

x1 = linspace(x1min, x1max, n);
x2 = linspace(x2min, x2max, n);
x = reshape(cat(3, repmat(x1, length(x2), 1)', ...
                   repmat(x2, length(x1), 1)), [], 2, 1);

y = sin(x1 - 2 * x2').^2 .* exp(-abs(x2'));
print_function_plot(x1, x2, y, 'Original Function', 'original_function.emf');

fis1 = readfis('../model/mamdani_trimf_5in_trimf_5out.fis');
y1 = reshape(evalfis(fis1, x), length(x1), length(x2))';
rmse1 = sqrt(sum(sum((y - y1).^2)) / numel(y1));
print_function_plot(x1, x2, y1, 'Mamdani Triangle MF Approximation', ...
                    'mamdani_trimf_5in_trimf_5out_approximation.emf', rmse1);

fis2 = readfis('../model/mamdani_trimf_5in_gaussmf_5out.fis');
y2 = reshape(evalfis(fis2, x), length(x1), length(x2))';
rmse2 = sqrt(sum(sum((y - y2).^2)) / numel(y2));
print_function_plot(x1, x2, y2, 'Mamdani Triangle-Gauss MF Approximation', ...
                    'mamdani_trimf_5in_gaussmf_5out_approximation.emf', rmse2);

fis3 = readfis('../model/mamdani_gaussmf_5in_trimf_5out.fis');
y3 = reshape(evalfis(fis3, x), length(x1), length(x2))';
rmse3 = sqrt(sum(sum((y - y3).^2)) / numel(y3));
print_function_plot(x1, x2, y3, 'Mamdani Gauss-Triangle MF Approximation', ...
                    'mamdani_gaussmf_5in_trimf_5out_approximation.emf', rmse3);

fis4 = readfis('../model/mamdani_gaussmf_5in_gaussmf_5out.fis');
y4 = reshape(evalfis(fis4, x), length(x1), length(x2))';
rmse4 = sqrt(sum(sum((y - y4).^2)) / numel(y4));
print_function_plot(x1, x2, y4, 'Mamdani Gauss MF Approximation', ...
                    'mamdani_gaussmf_5in_gaussmf_5out_approximation.emf', rmse4);

fis5 = readfis('../model/sugeno_trimf_5in_6out.fis');
y5 = reshape(evalfis(fis5, x), length(x1), length(x2))';
rmse5 = sqrt(sum(sum((y - y5).^2)) / numel(y5));
print_function_plot(x1, x2, y5, 'Sugeno Triangle MF Approximation', ...
                    'sugeno_trimf_5in_6out_approximation.emf', rmse5);

fis6 = readfis('../model/sugeno_gaussmf_5in_6out.fis');
y6 = reshape(evalfis(fis6, x), length(x1), length(x2))';
rmse6 = sqrt(sum(sum((y - y6).^2)) / numel(y6));
print_function_plot(x1, x2, y6, 'Sugeno Gauss MF Approximation', ...
                    'sugeno_gaussmf_5in_6out_approximation.emf', rmse6);

fis7 = readfis('../model/mamdani_gaussmf_7in_gaussmf_5out.fis');
y7 = reshape(evalfis(fis7, x), length(x1), length(x2))';
rmse7 = sqrt(sum(sum((y - y7).^2)) / numel(y7));
print_function_plot(x1, x2, y7, 'Mamdani Gauss MF Approximation', ...
                    'mamdani_gaussmf_7in_gaussmf_5out_approximation.emf', rmse7);

fis8 = readfis('../model/sugeno_gaussmf_7in_6out.fis');
y8 = reshape(evalfis(fis8, x), length(x1), length(x2))';
rmse8 = sqrt(sum(sum((y - y8).^2)) / numel(y8));
print_function_plot(x1, x2, y8, 'Sugeno Gauss MF Approximation', ...
                    'sugeno_gaussmf_7in_6out_approximation.emf', rmse8);

print_membership_functions_plot('x_1', x1, 5, 'trimf', 'Triangle MF', 'x1_trimf_5in.emf');
print_membership_functions_plot('x_2', x2, 5, 'trimf', 'Triangle MF', 'x2_trimf_5in.emf');
print_membership_functions_plot('y',    y, 5, 'trimf', 'Triangle MF', 'y_trimf_5out.emf');

print_membership_functions_plot('x_1', x1, 5, 'gaussmf', 'Gauss MF', 'x1_gaussmf_5in.emf');
print_membership_functions_plot('x_2', x2, 5, 'gaussmf', 'Gauss MF', 'x2_gaussmf_5in.emf');
print_membership_functions_plot('y',    y, 5, 'gaussmf', 'Gauss MF', 'y_gaussmf_5out.emf');

print_membership_functions_plot('x_1', x1, 7, 'trimf', 'Triangle MF', 'x1_trimf_7in.emf');
print_membership_functions_plot('x_2', x2, 7, 'trimf', 'Triangle MF', 'x2_trimf_7in.emf');
print_membership_functions_plot('y',    y, 7, 'trimf', 'Triangle MF', 'y_trimf_7out.emf');

print_membership_functions_plot('x_1', x1, 7, 'gaussmf', 'Gauss MF', 'x1_gaussmf_7in.emf');
print_membership_functions_plot('x_2', x2, 7, 'gaussmf', 'Gauss MF', 'x2_gaussmf_7in.emf');
print_membership_functions_plot('y',    y, 7, 'gaussmf', 'Gauss MF', 'y_gaussmf_7out.emf');
