// Gmsh project created on Fri Aug 21 15:24:00 2026
SetFactory("OpenCASCADE");

Rectangle(1) = {0, 0, 0, 40, 10, 0};
//+
Rectangle(2) = {5, 0, 0, 1, 1, 0};
//+
BooleanDifference{ Surface{1}; Delete; }{ Surface{2}; Delete; }
//+
Rectangle(2) = {5, 1, -0, 1, 9, 0};
//+
BooleanFragments{ Surface{1}; Delete; }{ Surface{2}; Delete; }
//+
Rectangle(5) = {0, 0, 0, 5, 1, 0};
//+
BooleanFragments{ Surface{3}; Delete; }{ Surface{5}; Delete; }
//+
Rectangle(7) = {6, 0, 0, 3, 1, 0};
//+
Rectangle(8) = {6, 1, 0, 3, 9, 0};
//+
Rectangle(9) = {9, 0, 0, 12, 1, 0};
//+
Rectangle(10) = {9, 1, 0, 12, 9, 0};
//+
Rectangle(11) = {21, 0, 0, 19, 1, 0};
//+
BooleanFragments{ Surface{4}; Delete; }{ Surface{7}; Surface{9}; Surface{10}; Surface{11}; Surface{8}; Delete; }
//+

/*
r=1;
Transfinite Curve {12, 17, 36, 11, 34, 29, 27, 19} = 3*r Using Progression 1;
//+
Transfinite Curve {15, 2, 10, 25, 22, 20} = 15*r Using Progression 1;
//+
Transfinite Curve {14, 16, 18} = 7*r Using Progression 1;
//+
Transfinite Curve {32, 30, 35} = 4*r Using Progression 1;
//+
Transfinite Curve {26, 24, 33} = 16*r Using Progression 1;
//+
Transfinite Curve {23, 21, 28} = 26*r Using Progression 1;
//+
Transfinite Surface {6};
//+
Transfinite Surface {2};
//+
Transfinite Surface {8};
//+
Transfinite Surface {10};
//+
Transfinite Surface {12};
//+
Transfinite Surface {11};
//+
Transfinite Surface {9};
//+
Transfinite Surface {7};
//+
Transfinite Surface {5};
//+
BooleanFragments{ Surface{2}; Surface{8}; Surface{6}; Delete; }{ }
//+
Transfinite Curve {44, 40, 38} = 15*r Using Progression 1;
//+
Transfinite Surface {6};
//+
Transfinite Surface {2};
//+
Transfinite Surface {8};
//+
BooleanFragments{ Surface{6}; Surface{5}; Delete; }{ }
//+
BooleanFragments{ Surface{8}; Surface{7}; Delete; }{ }
//+
BooleanFragments{ Surface{6}; Surface{2}; Surface{8}; Surface{10}; Surface{12}; Surface{11}; Surface{9}; Surface{7}; Surface{5}; Delete; }{ }
//+
Transfinite Curve {37, 35, 40, 25, 22, 20} = 15*r Using Progression 1;
//+
Transfinite Curve {38, 38, 36, 36, 47, 47} = 7*r Using Progression 1;
//+
Transfinite Curve {43, 43, 42, 42, 44, 44} = 5*r Using Progression 1;
//+
Transfinite Surface {6};
//+
Transfinite Surface {8};
//+
Transfinite Surface {5};
//+
Transfinite Surface {2};
//+
Transfinite Curve {39, 41, 48, 48, 46, 46, 45, 45, 34, 34, 29, 29, 27, 27} = 3*r Using Progression 1;
//+
Transfinite Surface {7};
//+
Transfinite Curve {25, 22, 20, 40, 35, 37} = 15*r Using Progression 1;
//+*/
Field[1] = MathEval;
//+
Field[1].F = "0.01*(y-10)^2";
//+
Background Field = 1;
//+
Field[1] = Distance;
