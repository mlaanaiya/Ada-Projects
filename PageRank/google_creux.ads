with LCA;

generic

   Borne : Integer;
   
package Google_Creux is
   type T_DoubleC is digits 6;

   type T_NetworkC is limited private;
   type T_VecteurC is limited private;
   type T_Vecteur_EntierC is limited private;

   -- Initialiser une matrice Google G.   
   procedure Enregistrer_Net(Network : in out T_NetworkC; pointeur : in Integer; pointee : in Integer; Value : in T_DoubleC);
  
   procedure Afficher (Network: T_NetworkC; index : Integer ; jndex : Integer);

  -- Initialiser une matrice Google G.
   --procedure Initialiser_G (G: in out T_NetworkC; Alpha : in Float);
   
   -- Multiplication d'une matrice Google G par un vecteur G
   procedure Multiplication_C(G : in T_NetworkC; V: in out T_VecteurC ; Alpha : in Float);
   
   --- Procedures pour T_Vecteur ---
   procedure AffectationC(Vecteur_poidsC : in out T_VecteurC; i : in Integer; V_initiale : in T_DoubleC);
  
   procedure Affectation_EntierC(Vecteur_poidsC : in out T_Vecteur_EntierC; i : in Integer; V : in Integer);   
   
   function ValeurC (Vecteur_poidsC : in T_VecteurC; i : in integer) return T_DoubleC;

   function Valeur_EntierC (Vecteur_poidsC : in T_Vecteur_EntierC; i : in integer) return Integer;

   procedure DecalageC (Vecteur_rangC : in out T_Vecteur_EntierC;i : in Integer;j : in Integer);
   
   procedure DecalageC (Vecteur_rangC : in out T_VecteurC;i : in Integer;j : in Integer);
  
   procedure TrierC(VecteurC : in out T_VecteurC);



private   
   
   type T_VecteurC is array (1..Borne) of T_DoubleC;

   type T_Vecteur_EntierC is array (1..Borne) of Integer;
   
   package P_LCA is new LCA(Integer, T_DoubleC);
   use P_LCA;
   -- T_Google :
   type T_NetworkC is array (1..Borne) of T_LCA;

end Google_Creux;
