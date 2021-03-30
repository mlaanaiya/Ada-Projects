with Ada.IO_Exceptions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with LCA;

package body Google_Creux is
   
   procedure Afficher (Network: T_NetworkC; index : Integer ; jndex : Integer) is
   begin
   Put(T_DoubleC'Image(P_LCA.La_Donnee(Network(index),jndex)));
   end Afficher;
   
   procedure Enregistrer_Net(Network : in out T_NetworkC; pointeur : in Integer; pointee : in Integer; Value : in T_DoubleC) is
   begin
      
       P_LCA.Enregistrer(Network(pointee),pointeur,Value);
   end Enregistrer_Net;
  
   
  -- procedure Initialiser_G (G: in out T_NetworkC; Alpha : in Float) is 
  -- N : T_DoubleC;
  -- jndex : Integer;
  -- begin 
      
     -- for index in 1..Borne loop
      --   if not(P_LCA.Est_Vide(G(index))) then
       --     N := T_DoubleC(Taille(G(index)));
       --     while not(P_LCA.Est_Vide(G(index))) loop
        --       Put(0);
         --      jndex := P_LCA.La_Cle(G(index));
        --       P_LCA.Enregistrer(G(index),jndex,T_DoubleC(Alpha)*P_LCA.La_Donnee(G(index),jndex)/N+T_DoubleC(1.0-Alpha)/T_DoubleC(Borne));
         --      Put(T_DoubleC'Image(P_LCA.La_Donnee(G(index),jndex)));
         --      P_LCA.Next(G(index));
        --    end loop;
      --   end if;
   --   end loop;
     
      
  -- end Initialiser_G;

    -- Multiplication d'une matrice Google G par un vecteur V.
   procedure Multiplication_C(G : in  T_NetworkC; V: in out T_VecteurC ; Alpha : in Float) is
   Somme : T_DoubleC := 0.0;
   V_tampon : T_VecteurC;
   begin
 
      for index in 1..Borne loop
         V_tampon(index) := 0.0;
      end loop;
      
      for index in 1..Borne loop
         -- Cas : ligne vide
         if P_LCA.Est_Vide(G(index)) then
            for jndex in 1..Borne loop
              -- Put(0);
               V_tampon(jndex) := V_tampon(jndex) + V(index)*(1.0/T_DoubleC(Borne));
               
            end loop;
         else
           for jndex in 1..Borne loop
               -- Cas: valeur non nulle
           	if P_LCA.Cle_Presente(G(index),jndex) then
                      -- Put(1);

                 	V_tampon(jndex) := V_tampon(jndex) + V(index)*(T_DoubleC(Alpha)/T_DoubleC(P_LCA.Taille(G(index)))+T_DoubleC(1.0-Alpha)/T_DoubleC(Borne));
                -- Cas : nulle mais ligne non vide
                else
                      -- Put(2);
                	V_tampon(jndex) := V_tampon(jndex) + V(index)*T_DoubleC(1.0-Alpha)/T_DoubleC(Borne);	
                        
 
                end if;
            end loop;
            

         end if;

      end loop;
  
  
      for i in 1..Borne loop
         V(i) := V_tampon(i);
      end loop;
   
      

   end Multiplication_C;
   

   --- Procedure pour manipuler les T_Vecteurs ---
   
   procedure AffectationC(Vecteur_poidsC : in out T_VecteurC; i : in Integer; V_initiale : in T_Doublec) is
   begin
     
      Vecteur_poidsC(i) := V_initiale;
      --Put(T_DoubleC'Image(V_initiale));

   
   end AffectationC;
   
   procedure Affectation_EntierC(Vecteur_poidsC : in out T_Vecteur_EntierC; i : in Integer; V : in Integer) is
   begin
      
      Vecteur_poidsC(i) := V;
   
   end Affectation_EntierC;
   
   function ValeurC (Vecteur_poidsC : in T_VecteurC; i : in integer) return T_DoubleC is
   begin
      return Vecteur_poidsC(i);
   end ValeurC;
   
   function Valeur_EntierC (Vecteur_poidsC : in T_Vecteur_EntierC; i : in integer) return Integer is
   begin
      return Vecteur_poidsC(i);
   end Valeur_EntierC;
   
   procedure DecalageC (Vecteur_rangC : in out T_Vecteur_EntierC;i : in Integer;j : in Integer) is
   begin
      Vecteur_rangC(i) := Vecteur_rangC(j);   
   end DecalageC;
   
      procedure DecalageC (Vecteur_rangC : in out T_VecteurC;i : in Integer;j : in Integer) is
   begin
      Vecteur_rangC(i) := Vecteur_rangC(j);   
   end DecalageC;


   procedure TrierC(VecteurC : in out T_VecteurC) is
   TamponC : T_DoubleC;
   j : Integer;
   begin
      for i in 2..Borne loop
      
          TamponC := VecteurC(i);
          j := i;

         while ( j>1 and then VecteurC(j-1) > TamponC ) loop
             
             VecteurC(j) := VecteurC(j-1);
             
             j := j-1;  
         end loop;
         
         VecteurC(j) := TamponC;
         
      end loop;       
   end TrierC;

end Google_Creux;
