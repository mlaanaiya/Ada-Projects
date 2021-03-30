with Ada.Unchecked_Deallocation;
with Ada.Text_IO; use Ada.Text_IO;
with TH;
package body TH is

   procedure Initialiser(Sda : out T_TH) is
   begin
      for i in 1..capacite loop
         Initialiser(Sda(i));
      end loop;
   end Initialiser;

   -------------------------------------------
   -------------------------------------------

   function Est_Vide (Sda : T_TH) return Boolean is
   begin
      for i in 1..capacite loop
         if not(Est_Vide(Sda(i))) then
            return False;
         end if;
      end loop;
      return True;
   end Est_Vide;

   --------------------------------------------
   --------------------------------------------

   function Taille (Sda : in T_TH) return Integer is
   a:Integer;
   begin
        a := 0;
        for i in 1..capacite loop
             a := Taille(Sda(i)) + a;
        end loop;
        return a;
   end Taille;

   ---------------------------------------------
   ---------------------------------------------

   procedure Enregistrer (Sda : in out T_TH ; Cle : in T_Cle ; Donnee : in T_Donnee) is
      indice : Integer;
   begin
      indice := fct_hach(Cle) mod capacite;
      if indice = 0 then
         Enregistrer(Sda(capacite),Cle,Donnee);
      else
         Enregistrer(Sda(indice),Cle,Donnee);
      end if;
   end Enregistrer;

   ---------------------------------------------
   ---------------------------------------------

   function Cle_Presente (Sda : in T_TH ; Cle : in T_Cle) return Boolean is
   indice : Integer;
   begin
         indice := fct_hach(Cle) mod capacite;

         if indice = 0 then
              return Cle_Presente(Sda(capacite),Cle);
         else
              return Cle_Presente(Sda(indice),Cle);
         end if;
   end Cle_Presente;

   -----------------------------------------------
   -----------------------------------------------

   function La_Donnee (Sda : in T_TH ; Cle : in T_Cle) return T_Donnee is
   indice : Integer;
   begin
      indice := fct_hach(Cle) mod capacite;
      if indice = 0 then
         return La_Donnee(Sda(capacite),Cle);
      else
         return La_Donnee(Sda(indice),Cle);
      end if;
   end La_Donnee;

   -------------------------------------------------
   -------------------------------------------------

   procedure Supprimer (Sda : in out T_TH ; Cle : in T_Cle) is
   indice : Integer;
   begin
           if not Cle_Presente(Sda,Cle) then
              raise Cle_Absente_Exception;
           else
              indice := fct_hach(Cle) mod capacite;
              if indice = 0 then
                 Supprimer(Sda(capacite),Cle);
              else
                 Supprimer(Sda(indice),Cle);
              end if;
           end if;
   end Supprimer;

   --------------------------------------------------
   --------------------------------------------------

   procedure Vider (Sda : in out T_TH) is
   begin
      if not(Est_Vide(Sda)) then
         for i in 1..capacite loop
              Vider(Sda(i));
         end loop;
      else
         null;
      end if;
   end Vider;

   ----------------------------------------------------
   ----------------------------------------------------

   procedure Pour_Chaque (Sda : in T_TH) is
      procedure pour is new TH_LCA.Pour_chaque(Traiter);
   begin
      for i in 1..capacite loop
         begin
            pour(Sda(i));
         exception
            when others =>
               Put("ERROR");
         end;
      end loop;
   end Pour_Chaque;


end TH;
