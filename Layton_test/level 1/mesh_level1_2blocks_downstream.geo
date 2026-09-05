// Layton et al. - Level 1 simplificado (r=2).
// Cinco bloques totales y solo dos bloques aguas abajo del obstaculo.
SetFactory("OpenCASCADE");

// Puntos: x = 0, 5, 6, 40; y = 0, 1, 10.
Point(1)  = {0,  0, 0};
Point(2)  = {0,  1, 0};
Point(3)  = {0, 10, 0};
Point(4)  = {5,  0, 0};
Point(5)  = {5,  1, 0};
Point(6)  = {5, 10, 0};
Point(7)  = {6,  0, 0};
Point(8)  = {6,  1, 0};
Point(9)  = {6, 10, 0};
Point(10) = {40, 0, 0};
Point(11) = {40, 1, 0};
Point(12) = {40,10, 0};

// Horizontales.
Line(1) = {1,4};       // fondo aguas arriba
Line(2) = {7,10};      // fondo aguas abajo
Line(3) = {2,5};       // interfaz y=1 aguas arriba
Line(4) = {5,8};       // cara superior del obstaculo
Line(5) = {8,11};      // interfaz y=1 aguas abajo
Line(6) = {3,6};       // techo, entrada
Line(7) = {6,9};       // techo sobre el obstaculo
Line(8) = {9,12};      // techo aguas abajo

// Verticales.
Line(9)  = {1,2};      // entrada inferior
Line(10) = {2,3};      // entrada superior
Line(11) = {4,5};      // obstaculo: cara izquierda
Line(12) = {5,6};      // interfaz x=5 superior
Line(13) = {7,8};      // obstaculo: cara derecha
Line(14) = {8,9};      // interfaz x=6 superior
Line(15) = {10,11};    // salida inferior
Line(16) = {11,12};    // salida superior

// Cinco superficies conformes.
Curve Loop(1) = {1,11,-3,-9};
Plane Surface(1) = {1};
Curve Loop(2) = {3,12,-6,-10};
Plane Surface(2) = {2};
Curve Loop(3) = {4,14,-7,-12};
Plane Surface(3) = {3};
Curve Loop(4) = {2,15,-5,-13};
Plane Surface(4) = {4};
Curve Loop(5) = {5,16,-8,-14};
Plane Surface(5) = {5};

r = 2;

// Dos elementos sobre las tres caras expuestas del obstaculo.
// Se conserva el mismo conteo en las aristas opuestas de cada bloque.
Transfinite Curve {4,7,9,11,13,15} = 2*r + 1 Using Progression 1;

// Diez elementos desde y=1 hasta y=10, concentrados cerca de y=1.
Transfinite Curve {10,12,14,16} = 10*r + 1 Using Progression 1.058300524;

// Entrada: seis elementos y concentracion hacia x=5.
Transfinite Curve {-1,-3,-6} = 6*r + 1 Using Progression 1.118033989;

// Toda la estela en una sola progresion continua: x=6 hasta x=40.
// La raiz cuadrada conserva la misma graduacion global que la malla validada de level 0.
Transfinite Curve {2,5,8} = 40*r + 1 Using Progression 1.012422837;

Transfinite Surface {1,2,3,4,5} Alternate;

Physical Surface("Fluid", 1) = {1,2,3,4,5};
Physical Curve("Bottom upstream", 1) = {1};
Physical Curve("Bottom downstream", 2) = {2};
Physical Curve("Obstacle left", 3) = {11};
Physical Curve("Obstacle top", 4) = {4};
Physical Curve("Obstacle right", 5) = {13};
Physical Curve("Outlet", 6) = {15,16};
Physical Curve("Top", 7) = {6,7,8};
Physical Curve("Inlet", 8) = {9,10};

Mesh.Smoothing = 0;
Mesh.MshFileVersion = 2.2;
