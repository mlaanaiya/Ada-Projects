with Ada.IO_Exceptions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with LCA;

package body Google_Naive is
   
   -- Initialiser une matrice Google G.
   procedure Initialiser_G (G: out T_Google; Network : in T_Network; Alpha : in Float) is 
   N : T_Double;
   Borne_D : T_Double;
   Alpha_D : T_Double := T_Double(Alpha);
   begin
   Borne_D := T_Double(Borne);

   -- Construire la matrice H
   
   for i in 1..Borne loop
         N := T_Double(P_LCA.Taille(Network(i)));
         for j in 1..Borne loop
            if P_LCA.Cle_Presente(Network(i),j) then
               G(i,j) := 1.0/N;
            else 
               G(i,j) := 0.0;
            end if;
         end loop;
   end loop;
            
   -- Construire la matrice S
   for i in 1..Borne loop
         if Est_Ligne_Vide(G,i) then
            for j in 1.. Borne loop
               G(i,j) := 1.0/Borne_D;
            end loop;
            --New_Line;
         end if;
   end loop;
   
   -- Construire la matrice G
   for i in 1..Borne loop
         for j in 1..Borne loop
            G(i,j) := Alpha_D*G(i,j) + (1.0-Alpha_D)/Borne_D;
            --Put(T_Double'Image(G(i,j)));
         end loop;
         --New_Line;
   end loop;
   
   end Initialiser_G;
      
   
   -- Est-ce que la ligne 'index' de la matrice Google G est vide ?
   function Est_Ligne_Vide (G : T_Google; index : Integer) return Boolean is
   
   begin
         -- Detecter si une ligne est vide
         for jndex in 1..Borne loop
            if G(index,jndex) /= 0.0 then
               return False;
            end if;
         end loop;
         
         return True;
         
   end Est_Ligne_Vide;
          
   
   procedure Enregistrer_Net(Network : in out T_Network; pointeur : in Integer; pointee : in Integer; Value : in Integer) is
   begin
      
       P_LCA.Enregistrer(Network(pointee),pointeur,Value);
      
   end Enregistrer_Net;
   

   
   -- Remplir la ligne si elle est vide, ne la change pas sinon
   procedure Remplissage (G : in out T_Google; index : in Integer) is
   Borne_D : T_Double;
   begin
         Borne_D := T_Double(Borne);
         if Est_Ligne_Vide(G,index) then
            for jndex in 1..Borne loop
               G(index,jndex) := 1.0/Borne_D;
            end loop;
         end if;
         
   end Remplissage;
  
  
   -- Multiplication d'une matrice Google G par un vecteur V.
   procedure Multiplication_N(G : in T_Google; V: in out T_Vecteur) is
   Somme : T_Double := 0.0;
   V_tampon : T_Vecteur;
   begin
         
         for index in 1..Borne loop
           -- Multiplication de transpose(G)*V.
            for jndex in 1..Borne loop
            
               Somme := Somme + G(jndex,index)*V(jndex);
            end loop;
            V_tampon(index) := Somme;
            --Put(T_Double'Image(Somme));
            
            Somme := 0.0;
         end loop;
         V := V_tampon;
   
   end Multiplication_N;
   

   --- Procedure pour manipuler les T_Vecteurs ---
   
   procedure Affectation(Vecteur_poids : in out T_Vecteur; i : in Integer; V_initiale : in T_Double) is
   begin
      
      Vecteur_poids(i) := V_initiale;
   
   end Affectation;
   
   procedure Affectation_Entier(Vecteur_poids : in out T_Vecteur_Entier; i : in Integer; V : in Integer) is
   begin
      
      Vecteur_poids(i) := V;
   
   end Affectation_Entier;
   
   function Valeur (Vecteur_poids : in T_Vecteur; i : in integer) return T_Double is
   begin
      return Vecteur_poids(i);
   end Valeur;
   
   function Valeur_Entier (Vecteur_poids : in T_Vecteur_Entier; i : in integer) return Integer is
   begin
      return Vecteur_poids(i);
   end Valeur_Entier;
   
   procedure Decalage (Vecteur_rang : in out T_Vecteur_Entier;i : in Integer;j : in Integer) is
   begin
      Vecteur_rang(i) := Vecteur_rang(j);   
   end Decalage;
   
      procedure Decalage (Vecteur_rang : in out T_Vecteur;i : in Integer;j : in Integer) is
   begin
      Vecteur_rang(i) := Vecteur_rang(j);   
   end Decalage;


   procedure Trier(Vecteur : in out T_Vecteur) is
   Tampon : T_Double;
   j : Integer;
   begin
      for i in 2..Borne loop
      
          Tampon := Vecteur(i);
          j := i;

         while (j>1 and then Vecteur(j-1) > Tampon) loop
             
             Vecteur(j) := Vecteur(j-1);
             
             j := j-1;  
         end loop;
         
         Vecteur(j) := Tampon;
         
      end loop;       
   end Trier;

end Google_Naive;
