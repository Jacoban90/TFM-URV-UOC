// Layton et al. - Level 1 (refinamiento r=2)
SetFactory("OpenCASCADE");

Rectangle(1) = {0, 0, 0, 40, 10, 0};
Rectangle(2) = {5, 0, 0, 1, 1, 0};
BooleanDifference{ Surface{1}; Delete; }{ Surface{2}; Delete; }
Rectangle(2) = {5, 1, 0, 1, 9, 0};
BooleanFragments{ Surface{1}; Delete; }{ Surface{2}; Delete; }
Rectangle(5) = {0, 0, 0, 5, 1, 0};
BooleanFragments{ Surface{3}; Delete; }{ Surface{5}; Delete; }
Rectangle(7)  = {6, 0, 0, 3, 1, 0};
Rectangle(8)  = {6, 1, 0, 3, 9, 0};
Rectangle(9)  = {9, 0, 0, 12, 1, 0};
Rectangle(10) = {9, 1, 0, 12, 9, 0};
Rectangle(11) = {21, 0, 0, 19, 1, 0};
BooleanFragments{ Surface{4}; Delete; }
  { Surface{7, 8, 9, 10, 11}; Delete; }
BooleanFragments{ Surface{2}; Delete; }
  { Surface{5, 6, 7, 8, 9, 10, 11, 12}; Delete; };

r = 2;
// Numero de nodos = elementos del level 0 multiplicados por r, mas uno.
Transfinite Curve {12, 17, 36, 11, 34, 29, 27, 19, 35, 46, 37, 39, 41} =
  2*r + 1 Using Progression 1;
Transfinite Curve {-15, -13, -2, 10, 31, 25, 22, 20, -43, -38, 36} =
  10*r + 1 Using Progression 1.058300524;
Transfinite Curve {14, 16, -18, -40, 42, 44} =
  6*r + 1 Using Progression 1.118033989;
Transfinite Curve {-32, -30, 45, -47, -48} =
  6*r + 1 Using Progression 1.058300524;
Transfinite Curve {-26, -24, 33} =
  14*r + 1 Using Progression 1.039230485;
Transfinite Curve {-23, -21, 28} =
  20*r + 1 Using Progression 0.985329278;

Transfinite Surface {2, 5, 6, 7, 8, 9, 10, 11, 12};
Transfinite Surface {2, 5, 6, 7, 8, 9, 10, 11, 12} Alternate;

Physical Surface("Fluid", 1) = {2, 5, 6, 7, 8, 9, 10, 11, 12};
Physical Curve("Bottom upstream", 1) = {40};
Physical Curve("Bottom downstream", 2) = {45, 33, 28};
Physical Curve("Obstacle left", 3) = {39};
Physical Curve("Obstacle top", 4) = {37};
Physical Curve("Obstacle right", 5) = {46};
Physical Curve("Outlet", 6) = {27, 20};
Physical Curve("Top", 7) = {44, 35, 48, 26, 23};
Physical Curve("Inlet", 8) = {41, 43};

Mesh.Smoothing = 0;
Mesh.MshFileVersion = 2.2;
