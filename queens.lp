% Queens No. 77
#const n = 8.

region(teal,    (1,1)).
region(teal,    (2,1)).
region(purple,  (3,1)).
region(purple,  (4,1)).
region(purple,  (5,1)).
region(purple,  (6,1)).
region(purple,  (7,1)).
region(purple,  (8,1)).

region(teal,    (1,2)).
region(teal,    (2,2)).
region(purple,  (3,2)).
region(pink,    (4,2)).
region(pink,    (5,2)).
region(pink,    (6,2)).
region(red,     (7,2)).
region(purple,  (8,2)).

region(purple,  (1,3)).
region(purple,  (2,3)).
region(purple,  (3,3)).
region(pink,    (4,3)).
region(pink,    (5,3)).
region(pink,    (6,3)).
region(purple,  (7,3)).
region(purple,  (8,3)).

region(purple,  (1,4)).
region(purple,  (2,4)).
region(purple,  (3,4)).
region(pink,    (4,4)).
region(pink,    (5,4)).
region(pink,    (6,4)).
region(purple,  (7,4)).
region(purple,  (8,4)).

region(purple,  (1,5)).
region(gray,    (2,5)).
region(gray,    (3,5)).
region(purple,  (4,5)).
region(purple,  (5,5)).
region(purple,  (6,5)).
region(purple,  (7,5)).
region(purple,  (8,5)).

region(purple,  (1,6)).
region(gray,    (2,6)).
region(gray,    (3,6)).
region(purple,  (4,6)).
region(purple,  (5,6)).
region(blue,    (6,6)).
region(blue,    (7,6)).
region(blue,    (8,6)).

region(purple,  (1,7)).
region(green,   (2,7)).
region(orange,  (3,7)).
region(orange,  (4,7)).
region(purple,  (5,7)).
region(blue,    (6,7)).
region(blue,    (7,7)).
region(blue,    (8,7)).

region(purple,  (1,8)).
region(purple,  (2,8)).
region(orange,  (3,8)).
region(orange,  (4,8)).
region(purple,  (5,8)).
region(blue,    (6,8)).
region(blue,    (7,8)).
region(blue,    (8,8)).

% place queens on the board
{ queen(X,Y) : X=1..n, Y=1..n } = n.

% cannot be in the same row or column
:- queen(X1,Y), queen(X2,Y), X1<X2.
:- queen(X,Y1), queen(X,Y2), Y1<Y2.

% cannot touch diagonally 
:- queen(X1,Y1), queen(X2,Y2), X2-X1=(-1;1), Y2-Y1=(-1;1).

% cannot be in the same region
:- queen(X1,Y1), queen(X2,Y2), region(C,(X1,Y1)), region(C,(X2,Y2)), (X1,Y1)!=(X2,Y2).

#show queen/2.