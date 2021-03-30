with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with LCA;


procedure lca_sujet is

   package LCA_String_Integer is new LCA (T_Cle => Unbounded_String, T_Donnee => Integer);
	use LCA_String_Integer;

	-- Retourner une chaîne avec des guillemets autour de S
   function Avec_Guillemets (S: Unbounded_String) return String is
   begin
	return '"' & To_String (S) & '"';
   end;
   procedure Afficher (S : in Unbounded_String; N: in Integer) is
   begin
      Put (Avec_Guillemets (S));
      Put (" : ");
      Put (N, 1);
      New_Line;
   end Afficher;

   procedure Afficher is new Pour_Chaque (Afficher); --Afficher une SDA

   Sda : T_LCA;
   Cle_1, Cle_2 : Unbounded_String;
   Donnee_1, Donnee_2 : Integer;

begin
   Initialiser (Sda);
   Cle_1 := To_Unbounded_String ("un");
   Cle_2 := To_Unbounded_String ("deux");
   Donnee_1 := 1;
   Donnee_2 := 2;
   Enregistrer (Sda, Cle_1, Donnee_1);
   Enregistrer (Sda, Cle_2, Donnee_2);
   Afficher (Sda);
   Vider (Sda);
end lca_sujet;
