with Ada.Unchecked_Deallocation;

package body LCA is

	procedure Free is
		new Ada.Unchecked_Deallocation (Object => T_Cellule, Name => T_LCA);


	procedure Initialiser(Sda: out T_LCA) is
        begin
            Sda := null;
	end Initialiser;

        -------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------

	function Est_Vide (Sda : T_LCA) return Boolean is
	begin
		return Sda = null;
	end;

        -------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------

        function Taille (Sda : in T_LCA) return Integer is
        begin
                if not(Est_Vide(Sda)) then
                       return Taille(Sda.all.next) + 1;
                else
                       return 0;
                end if;

	end Taille;

        -------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------

        procedure Enregistrer (Sda : in out T_LCA ; Cle : in T_Cle ; Donnee : in T_Donnee) is
        Sda_save : T_LCA;
        begin
           if Cle_Presente(Sda, Cle) then
              Sda_save := Sda;
              while Sda_save.all.Cle /= Cle loop
                  Sda_save := Sda_save.all.next;

              end loop;
              Sda_save.all.Donnee := Donnee;
           else
              Sda := new T_Cellule'(Cle, Donnee, Sda);
           end if;

	end Enregistrer;

        -------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------

	function Cle_Presente (Sda : in T_LCA ; Cle : in T_Cle) return Boolean is
	begin
           if Est_Vide(Sda) then
              return False;
           elsif Sda.all.Cle = Cle then
              return True;
           else
              return Cle_Presente(Sda.all.next, Cle);
           end if;
	end;

        -------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------

	function La_Donnee (Sda : in T_LCA ; Cle : in T_Cle) return T_Donnee is
	begin
           if Cle_Presente(Sda,Cle) then
              if Sda.all.Cle = Cle then
                 return Sda.all.Donnee;
              else
                 return La_donnee(Sda.all.next,Cle);
              end if;
           else
              raise Cle_Absente_Exception;
           end if;
	end La_Donnee;

        -------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------

	procedure Supprimer (Sda : in out T_LCA ; Cle : in T_Cle) is
        Sda_delete : T_LCA;
        begin
           if not Cle_Presente(Sda,Cle) then
              raise Cle_Absente_Exception;
           else
              if Sda.all.Cle = Cle then
                 Sda_delete := Sda;
                 Sda := Sda.all.next;
                 Free(Sda_delete);
              else
                 Supprimer(Sda.all.next,Cle);
              end if;
           end if;
	end Supprimer;

        -------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------

	procedure Vider (Sda : in out T_LCA) is
	begin
            if not(Est_Vide(Sda)) then
                Vider(Sda.all.next);
                Free(Sda);
            else
                null;
	    end if;
        end Vider;

        -------------------------------------------------------------------------------------
        -------------------------------------------------------------------------------------

	procedure Pour_Chaque (Sda : in T_LCA) is
	begin
           if not(Est_Vide(Sda)) then
              Traiter(Sda.all.Cle,Sda.all.Donnee);
              Pour_Chaque(Sda.all.next);
           else
              null;
           end if;
	end Pour_Chaque;


end LCA;


