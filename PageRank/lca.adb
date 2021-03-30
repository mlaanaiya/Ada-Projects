with Ada.Unchecked_Deallocation;

package body LCA is

   procedure Free is

     new Ada.Unchecked_Deallocation (Object => T_Cellule, Name => T_LCA);



   procedure Initialiser(Sda: out T_LCA) is

   begin

      Sda := Null;

   end Initialiser;



   function Est_Vide (Sda : T_LCA) return Boolean is

   begin

      return (Sda = Null);

   end;



   function Taille (Sda : in T_LCA) return Integer is
      taille : Integer := 0;
      curseur : T_LCA;

   begin

      curseur := Sda;

      while not(Est_Vide(curseur)) loop

         taille := taille + 1;
         curseur := curseur.all.Suivant;

      end loop;


      return taille;

   end Taille;



   procedure Enregistrer (Sda : in out T_LCA ; Cle : in T_Cle ; Donnee : in T_Donnee) is
      curseur : T_LCA;

   begin

      curseur := Sda;

      if Cle_Presente(curseur,Cle) then

         while curseur.all.Cle /= Cle loop

            curseur := curseur.all.Suivant;

         end loop;

         curseur.all.Donnee:= Donnee;

      else

         Sda := New T_Cellule'(Cle,Donnee,Sda);

         -- Ajout := New T_Cellule;
         -- Ajout.Suivant := Null;
         -- Ajout.all.Cle := Cle;
         -- Ajout.all.Donnee := Donnee;

         -- Sda.Suivant := Ajout

      end if;

   end Enregistrer;



   function Cle_Presente (Sda : in T_LCA ; Cle : in T_Cle) return Boolean is

   begin

      if Sda = Null then

         return False;

      elsif Sda.all.Cle = Cle then

         return True;

      else

         return Cle_Presente(Sda.all.Suivant, Cle);

      end if;
   end Cle_Presente;




   function La_Donnee (Sda : in T_LCA ; Cle : in T_Cle) return T_Donnee is

   begin

      if Cle_Presente(Sda,Cle) then

         if Sda.all.Cle = Cle then

            return Sda.all.Donnee;

         else

            return La_Donnee(Sda.all.Suivant,Cle);

         end if;

      else

         Raise Cle_Absente_Exception;

      end if;

   end La_Donnee;

  function La_Cle(Sda : in T_LCA ) return T_Cle is
  begin
      return Sda.all.Cle;
  end La_Cle;

   procedure Next (Sda : in out T_LCA) is
   begin
      Sda := Sda.all.Suivant;
   end Next;

   procedure Supprimer (Sda : in out T_LCA ; Cle : in T_Cle) is
   tampon : T_LCA;
   begin
      if not(Est_Vide(Sda)) then

         if Sda.all.Cle = Cle then
            tampon := Sda;
            Sda := Sda.all.Suivant;
            Free(tampon);
         else

            Supprimer(Sda.all.Suivant,Cle);

         end if;

      else

         Raise Cle_Absente_Exception;

      end if;


   end Supprimer;



   procedure Vider (Sda : in out T_LCA) is

   begin

      Free(Sda);

   end Vider;



   procedure Pour_Chaque (Sda : in T_LCA) is
      curseur : T_LCA;

   begin
      curseur := Sda;
      if not(Est_Vide(Sda)) then

         begin

            Traiter(curseur.all.Cle,curseur.all.Donnee);
            Pour_Chaque(curseur.all.Suivant);

         exception
            when others => Pour_Chaque(curseur.all.Suivant);

         end;

      end if;

   end Pour_Chaque;

end LCA;
