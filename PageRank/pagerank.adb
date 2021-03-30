with Ada.IO_Exceptions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_line; use Ada.Command_line;
with Ada.Strings.Unbounded;
with Ada.Strings;
with Google_Naive;
with Google_Creux;
with Ada.Assertions; use Ada.Assertions;

procedure pagerank is

   package SU renames Ada.Strings.Unbounded;
   use SU;

   -- descripteur de fichier texte (Ada.Text_IO)
   File : Ada.Text_IO.File_Type;

   Nom_Fichier, Nom_testr, Nom_test, Nom_Fichierr, Nom_Fichierp : SU.Unbounded_String;

   No_Argument_Error : Exception;

   -- Implémenter le package du google naive
   Exception_Option_not_Valid : Exception;


   Alpha : Float := 0.85;
   Nb_Max : Integer := 150;
   Borne: Integer;
   Creuse : Boolean := True;
   -- On l'utilisera pour extraire le nombre de noeuds du fichier .net
   function Nb_Noeuds(n : in Integer) return Integer is
   begin
      Open(File, In_File, Argument(n));
      Get(File, Borne);
      close(File);
      return Borne;
   end;

   -- Traiter les entrees de l'utilisateur
   procedure Traiter_Donnees(Creuse : in out Boolean; Alpha : in out Float; Nb_Max : in out Integer) is
   i : Integer :=1;
   begin
   while i < Argument_Count loop
         if Argument(i) = "-P" then
            Creuse := False;
            i := i+1;
            -- utiliser l'implantation google_creuse mais ne sera pas implémentée ici
         elsif Argument(i) = "-I" then
            -- Traiter l'entrée nombre d'itération
            Nb_Max := Integer'Value(Argument(i+1));
            i := i+2;
         elsif Argument(i) = "-A" then
            -- Traiter l'entrée alpha
            Alpha := Float'Value(Argument(i+1));
            i := i+2;
         else
             Raise Exception_Option_not_Valid;
         end if;

   end loop;

   end Traiter_Donnees;

      package Google_C is
        new Google_Creux(Nb_Noeuds(Argument_Count));
      package Google_N is
        new Google_Naive(Nb_Noeuds(Argument_Count));
      use Google_N;
      use Google_C;

   count : Integer := 1;
   G : T_Google;
   Vecteur_poids, Vecteur_poids2: T_Vecteur;
   Vecteur_poidsC, Vecteur_poids2C: T_VecteurC;
   Vecteur_rangC : T_Vecteur_EntierC;
   Vecteur_rang : T_Vecteur_Entier;
   V_initialeC: T_Doublec;
   V_initiale: T_Double;


   pointeur,pointee : Integer;
   X, rang_test : Integer;
   Network_N : T_Network;
   Network_C : T_NetworkC;

begin

   -- Traiter les arguments entrées en ligne de commande par l'utilisateur.
   Traiter_Donnees(Creuse, Alpha, Nb_Max);


   if Creuse then
     -- Eliminer l'extraction du nb de noeuds pour le traitement qui suit.
   open(File, In_File, Argument(Argument_Count));
   Get(File, Borne);
      -- Initialiser Network
      while not End_Of_File(File) loop
         Get(File,pointeur);
         Get(File,pointee);
         Enregistrer_Net(Network_C,pointee+1,pointeur+1,1.0);
      end loop;
      Close(File);
   -- Construire la matrice G
      --Initialiser_G(Network_C, Alpha);

        -- Afficher(Network_C,2,2);


      -- Calculer les poids r par itération
      V_initialeC :=  T_DoubleC(1.0/T_Double(Borne));
      for i in 1..Borne loop
         AffectationC(Vecteur_poidsC,i,V_initialeC);
      end loop;

      for i in 1..Nb_Max loop

         Multiplication_C(Network_C,Vecteur_poidsC,Alpha);

      end loop;


          -- Trier et ecrire les donnees dans un fichier correspondant
          -- Trier par insertion les indices des pages selon leurs poids
          -- du plus petit au plus grand

      -- Copie du vecteur poids
      for i in 1..Borne loop
         AffectationC(Vecteur_poids2C,i, ValeurC(Vecteur_poidsC,i));
      end loop;


      -- Trier le vecteur poids par ordre décroissant;
      TrierC(Vecteur_poids2C);

      for i in 1..Borne loop
         for j in 1..Borne loop
            if ValeurC(Vecteur_poids2C,i) = ValeurC(Vecteur_poidsC,j) then
               Affectation_EntierC(Vecteur_rangC,i,j);
            end if;
         end loop;
      end loop;
      -- Ecrire le fichier PageRank
      Nom_Fichier := To_Unbounded_String(Argument(Argument_Count));
      Unbounded_Slice(Nom_Fichier,Nom_Fichier,1,Length(Nom_Fichier)-3);

      Append(Nom_Fichier, "ord");
      Create(File, Out_File, To_String (Nom_Fichier));
      Close(File);

      Open(File, Append_File, To_String (Nom_Fichier));
      for i in 1..Borne loop
         X := Valeur_EntierC(Vecteur_rangC,Borne-i+1)-1;
         Put(File,Integer'Image(X));
         --Put(File,Vecteur_rang(Borne-i+1));
         New_Line(File);
      end loop;
      Close(File);

      -- Ecrire le fichier poids
      Nom_Fichier := To_Unbounded_String(Argument(Argument_Count));
      Unbounded_Slice(Nom_Fichier,Nom_Fichier,1,Length(Nom_Fichier)-3);

      Append(Nom_Fichier, "p");
      Create(File, Out_File, To_String (Nom_Fichier));
      Close(File);

      Open(File, Append_File, To_String (Nom_Fichier));
      Put(File,Borne);
      Put(File," ");
      Put(File,Alpha);
      Put(File," ");
      Put(File,Nb_Max);
      New_Line(File);
      for i in 1..Borne loop
         Put(File,T_DoubleC'Image((ValeurC(Vecteur_poids2C,Borne-i+1))));
         New_Line(File);
      end loop;
      Close(File);


        -- Ouverture du fichier test.p
   Nom_test := To_Unbounded_String(Argument(Argument_Count));
   Unbounded_Slice(Nom_test,Nom_testr,1,Length(Nom_test)-3);

   Append(Nom_testr,"tord");

   -- Partie Tests :

   -- Tests du fichier rang :
   Open(File, In_File, To_String(Nom_testr));

   for i in 1..Borne loop
      Get(File, rang_test);

      Assert( rang_test = Valeur_EntierC(Vecteur_rangC,Borne-i+1)-1);
   end loop;
   Close(File);
   Put(" Les tests du fichier pagerank (rang) sont bons pour l'implémentation Creuse ! ");

   ---- FIN GOOGLE CREUSE
   else
   ---- DEBUT GOOGLE NAIVE
     -- Eliminer l'extraction du nb de noeuds pour le traitement qui suit.
      open(File, In_File, Argument(Argument_Count));
   Get(File, Borne);
      -- Initialiser Network
      while not End_Of_File(File) loop
         Get(File,pointeur);
         Get(File,pointee);
         Enregistrer_Net(Network_N,pointee+1,pointeur+1,1);
      end loop;
      Close(File);
      -- Construire la matrice G
      Initialiser_G(G, Network_N, Alpha);

      -- Calculer les poids r par itération
      for i in 1..Borne loop
         V_initiale :=  T_Double(1.0/T_Double(Borne));
         Affectation(Vecteur_poids,i,V_initiale);
      end loop;

      for i in 1..Nb_Max loop
         Multiplication_N(G,Vecteur_poids);
      end loop;
      -- Trier et ecrire les donnees dans un fichier correspondant
      -- Trier par insertion les indices des pages selon leurs poids
      -- du plus petit au plus grand

      -- Copie du vecteur poids
      for i in 1..Borne loop
      Affectation(Vecteur_poids2,i, Valeur(Vecteur_poids,i));
      end loop;


      -- Trier le vecteur poids par ordre décroissant;
      Trier(Vecteur_poids2);

      for i in 1..Borne loop
         for j in 1..Borne loop
            if Valeur(Vecteur_poids2,i) = Valeur(Vecteur_poids,j) then
               Affectation_Entier(Vecteur_rang,i,j);
            end if;
         end loop;
      end loop;
      -- Ecrire le fichier PageRank
      Nom_Fichier := To_Unbounded_String(Argument(Argument_Count));
      Unbounded_Slice(Nom_Fichier,Nom_Fichierr,1,Length(Nom_Fichier)-3);
      Append(Nom_Fichierr, "ord");
      Create(File, Out_File, To_String (Nom_Fichierr));
      Close(File);

      Open(File, Append_File, To_String (Nom_Fichierr));
      for i in 1..Borne loop
         X := Valeur_Entier(Vecteur_rang,Borne-i+1)-1;
         Put(File,Integer'Image(X));
         --Put(File,Vecteur_rang(Borne-i+1));
         New_Line(File);
      end loop;
      Close(File);

      -- Ecrire le fichier poids
      Nom_Fichier := To_Unbounded_String(Argument(Argument_Count));
      Unbounded_Slice(Nom_Fichier,Nom_Fichierp,1,Length(Nom_Fichier)-3);

      Append(Nom_Fichierp, "p");
      Create(File, Out_File, To_String (Nom_Fichierp));
      Close(File);

      Open(File, Append_File, To_String (Nom_Fichierp));
      New_Line(File);
      Put(File,Borne);
      Put(File," ");
      Put(File,Alpha);
      Put(File," ");
      Put(File,Nb_Max);
      New_Line(File);
      for i in 1..Borne loop
         Put(File,T_Double'Image((Valeur(Vecteur_poids2,Borne-i+1))));
         New_Line(File);
      end loop;
      Close(File);



        -- Ouverture du fichier test.p
   Nom_test := To_Unbounded_String(Argument(Argument_Count));
   Unbounded_Slice(Nom_test,Nom_testr,1,Length(Nom_test)-3);

   Append(Nom_testr,"tord");

   -- Partie Tests :

   -- Tests du fichier rang :
   Open(File, In_File, To_String(Nom_testr));

   for i in 1..Borne loop
      Get(File, rang_test);

      Assert( rang_test = Valeur_Entier(Vecteur_rang,Borne-i+1)-1);
   end loop;
   Put("Les tests du fichier pagerank (rang) sont bons pour l'implémentation Naive ! ");
   Close(File);

   end if;

end pagerank;
