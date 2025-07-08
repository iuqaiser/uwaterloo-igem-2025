function [] = biofilm_spread()
% Modelling the spread of the biofilm along the catheter
% Variables:
% 

%% Outer Surface
% Equation parameters
r = 0.5;    % growth rate
D = 0.1;    % diffusion coefficient

% Space parameters
% x in [x0, x1]
h = 0.05;      % Space discretization step
s = 20.0;      % Interval length
x0 = 0;        % Left border
x1 = s;        % Right border
x = x0:h:x1;   % Space grid
J = length(x); % Size of the grid

% Dynamic variables
u = zeros(J, 1);     % Variable u, store only current state at time t
newu = zeros(J, 1);  % Auxillary variable for memory management

% Laplacian discretization with 'no flux' Neumann boundary conditions
% no flux, i.e. du/dx = 0 in x0 and in x1

% The discrete Laplacian L is a JxJ matrix
% In 1D, this is a symmetric, tridiagonal matrix
L = sparse(1:J, 1:J, -2);
L = spdiags(ones(J, 2), [-1, 1], L);
L(1, :) = 0;
L(J, :) = 0;

% Initial Conditions
u(x < s/10) = exp(-x(x < s/10.^2/0.2)); 

% Time Parameters
t0 = 0;
tfinal = 35;
t = t0;
tp = t0;
dt = min(0.5, 0.9*(h^2/2/D))

figure(1); clf;
plot(x, u);
axis([x0 x1 -0.1 1.1])
% uncomment the 2 lines below to see the ic before running the simulation
%disp('')
%pause

% Main Loop
tic
while t < tfinal
    drawnow;

    % Time update numerical scheme: Forward-Euler (explicit) for the rxn
    % term and the discrete Laplacian
    newu = u + dt * r * u.*(1 - u) + dt / h^2 * D * L * u;

    % Boundary conditions: Neumann 'no flux' at both ends
    % du/dx = 0 at x = x0 and x1
    newu(1) = newu(2);        % no flux means u(x0) = u(x0+h)
    newu(J) = newu(J - 1);    % no flux means u(x1) = u(x1-h)
    u = newu;                 % now that the full sol'n has been computed, update u

    % Plot the solution only when t crosses an integer
    if (fix(10 * t) > fix(10 * tp))
        plot(x, u);
        axis([x0 x1 -0.1 1.1])
    end

    tp = t;
    t = t + dt;
    fprintf("t = %.5f/n", t);
end
toc

% FKPP Equation w/ explicit finite difference scheme
% dn/dt = k * (d^2n/dx^2) + f(n)
%pde = @(x, t, n, DnDx) DnDx;  % dn/dt = d^2n/dx^2


end