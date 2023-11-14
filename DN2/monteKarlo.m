(* ::Package:: *)

(*Funkcija za izra\[CHacek]un \[SHacek]t. Pi in izris*)

monteKarlo[n_] := Module[{vkrogu, to\[CHacek]ke, x, y, izristo\[CHacek]k},
  vkrogu = 0;
  to\[CHacek]ke = n;
  
  izristo\[CHacek]k = Table[
    {x, y} = {RandomReal[], RandomReal[]};
    
    
    If[x^2 + y^2 <= 1, vkrogu++];
    {x, y}, {n}];

  
  aprkosimacijaPi = 4. * vkrogu / to\[CHacek]ke;

  
  Print["Pribli\[ZHacek]na vrednost \[SHacek]tevila Pi pri \[SHacek]tevilu to\[CHacek]k: ", to\[CHacek]ke, " zna\[SHacek]a: "];
  Print[aprkosimacijaPi, "   :))" ];
  
  Graphics[{
    PointSize[0.01];
    Point[izristo\[CHacek]k],
    {Thick, Blue, Circle[{0, 0}, 1, {0, Pi/2}]}
  }, Axes -> True, AxesLabel -> {"X", "Y"}, PlotLabel -> "Grafi\[CHacek]ni prikaz: pribli\[ZHacek]na vrednost \[SHacek]tevila Pi"]
]

