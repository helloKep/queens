# LinkedIn Queens

The N-Queens problem is actually a resource that we use in the computer science department at Universität Potsdam to help teach Answer Set Programming (ASP) to students, so it was exciting to see LinkedIn release it as a daily playable game.
The game features a significant change from the version we teach, which is the presence of the the color regions.
In our simplified version, players only need to develop an encoding that prevents queens from occupying the same row and column, as well as from touching adjacent diagonal cells.

This repository uses an example board from [Game No. 77](https://www.linkedin.com/posts/queens-game_queens-no-77-activity-7218872088877510656-Jxvf/).

In this respository is also an encoding that uses only five lines of logic to solve the puzzle:
```
 1   #const n = 8.
 2   
 3   % place queens on the board
 4   { queen(X,Y) : X=1..n, Y=1..n } = n.
 5  
 6   % cannot be in the same row or column
 7   :- queen(X1,Y), queen(X2,Y), X1<X2.
 8   :- queen(X,Y1), queen(X,Y2), Y1<Y2.
 9 
10   % cannot touch diagonally 
11   :- queen(X1,Y1), queen(X2,Y2), X2-X1=(-1;1), Y2-Y1=(-1;1).
12 
13   % cannot be in the same region
14   :- queen(X1,Y1), queen(X2,Y2), region(C,(X1,Y1)), region(C,(X2,Y2)), (X1,Y1)!=(X2,Y2).
15 
16   #show queen/2.
```

Brief explanations:
* **Line 1** sets a constant value `n = 8` which represents both the length and width of the board, as well as the number of distinct color regions.
* **Line 4** uses a choice rule `{ queen(X,Y) : X=1..n, Y=1..n } = n` to consider all conceivable placements of queens on the board
* **Lines 7** and 8 uses integrity constraints to eliminate candidates in which two queens are placed in the same row or the same column
* **Line 11** uses an integrity constraint to eliminate candidates in which two queens are placed in adjacent (diagonal) cells
* **Line 14** uses an integrity constraint to find the associated color region for each queen, and eliminates candidates in which two queens share the same region

There are countless other ways to use ASP to solve this problem; some may include slight variations on the above; others may be vastly different.
The takeaway is that when using ASP, we don't explicitly write out steps for the program to follow, but rather a specification of the problem, particularly the constraints that we'd like to enforce.
