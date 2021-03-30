with LCA;
with Ada.Text_IO;

generic

   Borne : Integer;
   
package Google_Naive is

   type T_Double is digits 6;
   type T_Network is limited private;
   type T_Google is limited private;
   type T_Vecteur is limited private;
   type T_Vecteur_Entier is limited private;
   
   -- Initialiser une matrice Google G.
   procedure Initialiser_G (G: out T_Google; Network : in T_Network; Alpha : in Float);
   
   -- Est-ce que la ligne 'index' de la matrice Google G est vide ?
   function Est_Ligne_Vide (G : T_Google; index : Integer) return Boolean;
   
   -- Enregistrer dans une liste de LCA la donnée Value dans le tableau[pointee] dans une LCA de clé = pointeur.
   procedure Enregistrer_Net(Network : in out T_Network; pointeur : in Integer; pointee : in Integer; Value : in Integer);
   
   -- Remplir la ligne si elle est vide, ne la change pas sinon
   procedure Remplissage (G : in out T_Google; index : in Integer) with
     Pre => Est_Ligne_Vide(G,index),
     Post => not(Est_Ligne_Vide(G,index));
   
   -- Multiplication d'une matrice Google G par un vecteur V
   procedure Multiplication_N(G : in T_Google; V: in out T_Vecteur);
   
   --- Procedures pour T_Vecteur ---
   procedure Affectation(Vecteur_poids : in out T_Vecteur; i : in Integer; V_initiale : in T_Double);
  
   procedure Affectation_Entier(Vecteur_poids : in out T_Vecteur_Entier; i : in Integer; V : in Integer);   
   
   function Valeur (Vecteur_poids : in T_Vecteur; i : in integer) return T_Double;

   function Valeur_Entier (Vecteur_poids : in T_Vecteur_Entier; i : in integer) return Integer;

   -- Le nome découle de l'utilisation à faire.
   procedure Decalage (Vecteur_rang : in out T_Vecteur_Entier;i : in Integer;j : in Integer);
   
   procedure Decalage (Vecteur_rang : in out T_Vecteur;i : in Integer;j : in Integer);
  
   procedure Trier(Vecteur : in out T_Vecteur);



private   
   type T_Google is array (1..Borne, 1..Borne) of T_Double;
   
   type T_Vecteur is array (1..Borne) of T_Double;

   type T_Vecteur_Entier is array (1..Borne) of Integer;
   
       
   package P_LCA is new LCA(Integer, Integer);
   use P_LCA;
   
   type T_Network is array (1..Borne) of T_LCA;
   
end Google_Naive;
