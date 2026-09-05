// Layton et al. - Level 0
// Malla estructurada multibloque con graduacion hacia el obstaculo y la estela.
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

  BooleanFragments
{
  Surface{2}; Delete;
}
{
  Surface{5, 6, 7, 8, 9, 10, 11, 12}; Delete;
};

  r=1;
// Dos elementos en las tres aristas expuestas del obstaculo:
// curva 17: lateral izquierdo; 12: cara superior; 36: lateral derecho.
// El mismo conteo se aplica a las curvas opuestas de los bloques adyacentes.
Transfinite Curve {12, 17, 36, 11, 34, 29, 27, 19, 35, 46, 37, 39, 41} =
  3 Using Progression 1;

// Diez elementos verticales por encima de y=1, con graduacion suave.
Transfinite Curve {-15, -13, -2, 10, 31, 25, 22, 20,-43,-38,36} =
  11 Using Progression 1.12;

// Tramo de entrada 0 <= x <= 5: concentracion hacia x=5.
Transfinite Curve {14, 16, -18, -40, 42, 44} =
  7 Using Progression 1.25;

// Estela inmediata 6 <= x <= 9: concentracion hacia x=6.
Transfinite Curve {-32, -30, 45, -47, -48} =
  7 Using Progression 1.12;

// Estela intermedia 9 <= x <= 21: crecimiento moderado.
Transfinite Curve {-26, -24, 33} =
  15 Using Progression 1.08;

// Zona lejana 21 <= x <= 40: casi uniforme.
Transfinite Curve {-23, -21, 28} =
  21 Using Progression 1.03;

Transfinite Surface {2, 5, 6, 7, 8, 9, 10, 11, 12};

// Mantener triangulos, alternando las diagonales dentro de cada bloque.
Transfinite Surface {2, 5, 6, 7, 8, 9, 10, 11, 12} Alternate;



// Etiquetas compatibles con Layton_test.edp.
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
Mesh.MshFileVersion = 2.2;//+
BooleanUnion{ Surface{10}; Delete; }{ Surface{12}; Delete; }
//+
BooleanUnion{ Surface{8}; Delete; }{ Surface{10}; Delete; }
//+
BooleanUnion{ Surface{7}; Delete; }{ Surface{9}; Surface{11}; Delete; }
//+
Transfinite Curve {50, 48, 49} = 10 Using Progression 1.20;
