% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% each cell gets exactly one number (1..4)
{ sudoku(X, Y, N) : N = 1..4} = 1 :- X = 1..4, Y = 1..4.

% initial is part of the answer if initial(X, Y, N) for row X in column Y
sudoku(X, Y, N) :- initial(X, Y, N).

% values may not share the same row (need to compare columns)
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2.

% values may not share the same column (need to compare rows)
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2.

% the subgrid with the formula for G that cell (X, Y) belongs to
subgrid(X, Y, G) :- X = 1..4, Y = 1..4, G = 1 + (((X-1)/2)*2 + (Y-1)/2).

#show sudoku/3.