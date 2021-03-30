with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with TH;


procedure th_sujet is
   function fct_hach1(Cle : in Unbounded_String) return Integer is
   begin
      return Length(Cle);
   end fct_hach1;

   package TH_String_Integer is new TH (T_Cle => Unbounded_String, T_Donnee => Integer, capacite => 11, fct_hach => fct_hach1);
	use TH_String_Integer;

   function Avec_Guillemets (S: Unbounded_String) return String is -- Retourner une chaîne avec des guillemets autour de S
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


   procedure Afficher is new Pour_Chaque (Afficher);-- Afficher la Sda.

   Sda:T_TH;
   Cle_1,Cle_2,Cle_3,Cle_4,Cle_5,Cle_99,Cle_21 : Unbounded_String;
   Donnee_1,Donnee_2,Donnee_3,Donnee_4,Donnee_5,Donnee_99,Donnee_21 : Integer;

begin
   Initialiser(Sda);
   Cle_1 := To_Unbounded_String("un");
   Cle_2 := To_Unbounded_String("deux");
   Cle_3 := To_Unbounded_String("trois");
   Cle_4 := To_Unbounded_String("quatre");
   Cle_5 := To_Unbounded_String("cinq");
   Cle_99 := To_Unbounded_String("quatre-vingt-dix-neuf");
   Cle_21 := To_Unbounded_String("vingt-un");
   Donnee_1 := 1;
   Donnee_2 := 2;
   Donnee_3 := 3;
   Donnee_4 := 4;
   Donnee_5 := 5;
   Donnee_99 := 99;
   Donnee_21 := 21;
   Enregistrer(Sda,Cle_1,Donnee_1);
   Enregistrer(Sda,Cle_2,Donnee_2);
   Enregistrer(Sda,Cle_3,Donnee_3);
   Enregistrer(Sda,Cle_4,Donnee_4);
   Enregistrer(Sda,Cle_5,Donnee_5);
   Enregistrer(Sda,Cle_99,Donnee_99);
   Enregistrer(Sda,Cle_21,Donnee_21);
   Afficher(Sda);
   Vider(Sda);
end th_sujet;
