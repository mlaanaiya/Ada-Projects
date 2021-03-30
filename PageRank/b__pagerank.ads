pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 7.5.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_pagerank" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#40e05610#;
   pragma Export (C, u00001, "pagerankB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#7ec093d3#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#9094876d#;
   pragma Export (C, u00005, "ada__assertionsB");
   u00006 : constant Version_32 := 16#1a0b0d2c#;
   pragma Export (C, u00006, "ada__assertionsS");
   u00007 : constant Version_32 := 16#c2326fda#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#6e98a13f#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#4635ec04#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#4e7785b8#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#d8b13451#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#381fe17b#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#30ad09e5#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#fca7137e#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#f103f468#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#6bf6a600#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#c88a87ec#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#1b9b8546#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00024, "system__exceptionsB");
   u00025 : constant Version_32 := 16#2e5681f2#;
   pragma Export (C, u00025, "system__exceptionsS");
   u00026 : constant Version_32 := 16#843d48dc#;
   pragma Export (C, u00026, "system__exceptions__machineS");
   u00027 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00027, "system__exceptions_debugB");
   u00028 : constant Version_32 := 16#38bf15c0#;
   pragma Export (C, u00028, "system__exceptions_debugS");
   u00029 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00029, "system__img_intB");
   u00030 : constant Version_32 := 16#44ee0cc6#;
   pragma Export (C, u00030, "system__img_intS");
   u00031 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00031, "system__tracebackB");
   u00032 : constant Version_32 := 16#181732c0#;
   pragma Export (C, u00032, "system__tracebackS");
   u00033 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00033, "system__traceback_entriesB");
   u00034 : constant Version_32 := 16#466e1a74#;
   pragma Export (C, u00034, "system__traceback_entriesS");
   u00035 : constant Version_32 := 16#6fd210f2#;
   pragma Export (C, u00035, "system__traceback__symbolicB");
   u00036 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00036, "system__traceback__symbolicS");
   u00037 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00037, "ada__exceptions__tracebackB");
   u00038 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00038, "ada__exceptions__tracebackS");
   u00039 : constant Version_32 := 16#9f00b3d3#;
   pragma Export (C, u00039, "system__address_imageB");
   u00040 : constant Version_32 := 16#e7d9713e#;
   pragma Export (C, u00040, "system__address_imageS");
   u00041 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00041, "system__wch_conB");
   u00042 : constant Version_32 := 16#5d48ced6#;
   pragma Export (C, u00042, "system__wch_conS");
   u00043 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00043, "system__wch_stwB");
   u00044 : constant Version_32 := 16#7059e2d7#;
   pragma Export (C, u00044, "system__wch_stwS");
   u00045 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00045, "system__wch_cnvB");
   u00046 : constant Version_32 := 16#52ff7425#;
   pragma Export (C, u00046, "system__wch_cnvS");
   u00047 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00047, "interfacesS");
   u00048 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00048, "system__wch_jisB");
   u00049 : constant Version_32 := 16#d28f6d04#;
   pragma Export (C, u00049, "system__wch_jisS");
   u00050 : constant Version_32 := 16#52f1910f#;
   pragma Export (C, u00050, "system__assertionsB");
   u00051 : constant Version_32 := 16#8bb8c090#;
   pragma Export (C, u00051, "system__assertionsS");
   u00052 : constant Version_32 := 16#c0061b29#;
   pragma Export (C, u00052, "ada__command_lineB");
   u00053 : constant Version_32 := 16#9c1a321d#;
   pragma Export (C, u00053, "ada__command_lineS");
   u00054 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00054, "ada__float_text_ioB");
   u00055 : constant Version_32 := 16#af9f2fd5#;
   pragma Export (C, u00055, "ada__float_text_ioS");
   u00056 : constant Version_32 := 16#1d1c6062#;
   pragma Export (C, u00056, "ada__text_ioB");
   u00057 : constant Version_32 := 16#e1e47390#;
   pragma Export (C, u00057, "ada__text_ioS");
   u00058 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00058, "ada__streamsB");
   u00059 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00059, "ada__streamsS");
   u00060 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00060, "ada__io_exceptionsS");
   u00061 : constant Version_32 := 16#3d17c74c#;
   pragma Export (C, u00061, "ada__tagsB");
   u00062 : constant Version_32 := 16#5a4e344a#;
   pragma Export (C, u00062, "ada__tagsS");
   u00063 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00063, "system__htableB");
   u00064 : constant Version_32 := 16#c2f75fee#;
   pragma Export (C, u00064, "system__htableS");
   u00065 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00065, "system__string_hashB");
   u00066 : constant Version_32 := 16#60a93490#;
   pragma Export (C, u00066, "system__string_hashS");
   u00067 : constant Version_32 := 16#72b39087#;
   pragma Export (C, u00067, "system__unsigned_typesS");
   u00068 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00068, "system__val_lluB");
   u00069 : constant Version_32 := 16#0841c7f5#;
   pragma Export (C, u00069, "system__val_lluS");
   u00070 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00070, "system__val_utilB");
   u00071 : constant Version_32 := 16#ea955afa#;
   pragma Export (C, u00071, "system__val_utilS");
   u00072 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00072, "system__case_utilB");
   u00073 : constant Version_32 := 16#623c85d3#;
   pragma Export (C, u00073, "system__case_utilS");
   u00074 : constant Version_32 := 16#4c01b69c#;
   pragma Export (C, u00074, "interfaces__c_streamsB");
   u00075 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00075, "interfaces__c_streamsS");
   u00076 : constant Version_32 := 16#36a43a0a#;
   pragma Export (C, u00076, "system__crtlS");
   u00077 : constant Version_32 := 16#4db84b5a#;
   pragma Export (C, u00077, "system__file_ioB");
   u00078 : constant Version_32 := 16#e1440d61#;
   pragma Export (C, u00078, "system__file_ioS");
   u00079 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00079, "ada__finalizationS");
   u00080 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00080, "system__finalization_rootB");
   u00081 : constant Version_32 := 16#09c79f94#;
   pragma Export (C, u00081, "system__finalization_rootS");
   u00082 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00082, "interfaces__cB");
   u00083 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00083, "interfaces__cS");
   u00084 : constant Version_32 := 16#cc2ce7a7#;
   pragma Export (C, u00084, "system__os_libB");
   u00085 : constant Version_32 := 16#c1e9580f#;
   pragma Export (C, u00085, "system__os_libS");
   u00086 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00086, "system__stringsB");
   u00087 : constant Version_32 := 16#388afd62#;
   pragma Export (C, u00087, "system__stringsS");
   u00088 : constant Version_32 := 16#bbaa76ac#;
   pragma Export (C, u00088, "system__file_control_blockS");
   u00089 : constant Version_32 := 16#d5f9759f#;
   pragma Export (C, u00089, "ada__text_io__float_auxB");
   u00090 : constant Version_32 := 16#f854caf5#;
   pragma Export (C, u00090, "ada__text_io__float_auxS");
   u00091 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00091, "ada__text_io__generic_auxB");
   u00092 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00092, "ada__text_io__generic_auxS");
   u00093 : constant Version_32 := 16#8aa4f090#;
   pragma Export (C, u00093, "system__img_realB");
   u00094 : constant Version_32 := 16#819dbde6#;
   pragma Export (C, u00094, "system__img_realS");
   u00095 : constant Version_32 := 16#42a257f7#;
   pragma Export (C, u00095, "system__fat_llfS");
   u00096 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00096, "system__float_controlB");
   u00097 : constant Version_32 := 16#a6c9af38#;
   pragma Export (C, u00097, "system__float_controlS");
   u00098 : constant Version_32 := 16#3e932977#;
   pragma Export (C, u00098, "system__img_lluB");
   u00099 : constant Version_32 := 16#3b7a9044#;
   pragma Export (C, u00099, "system__img_lluS");
   u00100 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00100, "system__img_unsB");
   u00101 : constant Version_32 := 16#ed47ac70#;
   pragma Export (C, u00101, "system__img_unsS");
   u00102 : constant Version_32 := 16#16458a73#;
   pragma Export (C, u00102, "system__powten_tableS");
   u00103 : constant Version_32 := 16#faa9a7b2#;
   pragma Export (C, u00103, "system__val_realB");
   u00104 : constant Version_32 := 16#b81c9b15#;
   pragma Export (C, u00104, "system__val_realS");
   u00105 : constant Version_32 := 16#b2a569d2#;
   pragma Export (C, u00105, "system__exn_llfB");
   u00106 : constant Version_32 := 16#fa4b57d8#;
   pragma Export (C, u00106, "system__exn_llfS");
   u00107 : constant Version_32 := 16#1e40f010#;
   pragma Export (C, u00107, "system__fat_fltS");
   u00108 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00108, "ada__integer_text_ioB");
   u00109 : constant Version_32 := 16#b85ee1d1#;
   pragma Export (C, u00109, "ada__integer_text_ioS");
   u00110 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00110, "ada__text_io__integer_auxB");
   u00111 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00111, "ada__text_io__integer_auxS");
   u00112 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00112, "system__img_biuB");
   u00113 : constant Version_32 := 16#b49118ca#;
   pragma Export (C, u00113, "system__img_biuS");
   u00114 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00114, "system__img_llbB");
   u00115 : constant Version_32 := 16#f5560834#;
   pragma Export (C, u00115, "system__img_llbS");
   u00116 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00116, "system__img_lliB");
   u00117 : constant Version_32 := 16#577ab9d5#;
   pragma Export (C, u00117, "system__img_lliS");
   u00118 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00118, "system__img_llwB");
   u00119 : constant Version_32 := 16#5c3a2ba2#;
   pragma Export (C, u00119, "system__img_llwS");
   u00120 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00120, "system__img_wiuB");
   u00121 : constant Version_32 := 16#dad09f58#;
   pragma Export (C, u00121, "system__img_wiuS");
   u00122 : constant Version_32 := 16#d763507a#;
   pragma Export (C, u00122, "system__val_intB");
   u00123 : constant Version_32 := 16#0e90c63b#;
   pragma Export (C, u00123, "system__val_intS");
   u00124 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00124, "system__val_unsB");
   u00125 : constant Version_32 := 16#621b7dbc#;
   pragma Export (C, u00125, "system__val_unsS");
   u00126 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00126, "system__val_lliB");
   u00127 : constant Version_32 := 16#dc110aa4#;
   pragma Export (C, u00127, "system__val_lliS");
   u00128 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00128, "ada__stringsS");
   u00129 : constant Version_32 := 16#3791e504#;
   pragma Export (C, u00129, "ada__strings__unboundedB");
   u00130 : constant Version_32 := 16#9fdb1809#;
   pragma Export (C, u00130, "ada__strings__unboundedS");
   u00131 : constant Version_32 := 16#60da0992#;
   pragma Export (C, u00131, "ada__strings__searchB");
   u00132 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00132, "ada__strings__searchS");
   u00133 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00133, "ada__strings__mapsB");
   u00134 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00134, "ada__strings__mapsS");
   u00135 : constant Version_32 := 16#e95cd909#;
   pragma Export (C, u00135, "system__bit_opsB");
   u00136 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00136, "system__bit_opsS");
   u00137 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00137, "ada__charactersS");
   u00138 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00138, "ada__characters__latin_1S");
   u00139 : constant Version_32 := 16#933d1555#;
   pragma Export (C, u00139, "system__compare_array_unsigned_8B");
   u00140 : constant Version_32 := 16#ef369d89#;
   pragma Export (C, u00140, "system__compare_array_unsigned_8S");
   u00141 : constant Version_32 := 16#97d13ec4#;
   pragma Export (C, u00141, "system__address_operationsB");
   u00142 : constant Version_32 := 16#55395237#;
   pragma Export (C, u00142, "system__address_operationsS");
   u00143 : constant Version_32 := 16#a2250034#;
   pragma Export (C, u00143, "system__storage_pools__subpoolsB");
   u00144 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00144, "system__storage_pools__subpoolsS");
   u00145 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00145, "system__finalization_mastersB");
   u00146 : constant Version_32 := 16#1dc9d5ce#;
   pragma Export (C, u00146, "system__finalization_mastersS");
   u00147 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00147, "system__img_boolB");
   u00148 : constant Version_32 := 16#b3ec9def#;
   pragma Export (C, u00148, "system__img_boolS");
   u00149 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00149, "system__ioB");
   u00150 : constant Version_32 := 16#d8771b4b#;
   pragma Export (C, u00150, "system__ioS");
   u00151 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00151, "system__storage_poolsB");
   u00152 : constant Version_32 := 16#65d872a9#;
   pragma Export (C, u00152, "system__storage_poolsS");
   u00153 : constant Version_32 := 16#9aad1ff1#;
   pragma Export (C, u00153, "system__storage_pools__subpools__finalizationB");
   u00154 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00154, "system__storage_pools__subpools__finalizationS");
   u00155 : constant Version_32 := 16#020a3f4d#;
   pragma Export (C, u00155, "system__atomic_countersB");
   u00156 : constant Version_32 := 16#f269c189#;
   pragma Export (C, u00156, "system__atomic_countersS");
   u00157 : constant Version_32 := 16#3c420900#;
   pragma Export (C, u00157, "system__stream_attributesB");
   u00158 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00158, "system__stream_attributesS");
   u00159 : constant Version_32 := 16#4f0c3b82#;
   pragma Export (C, u00159, "google_creuxB");
   u00160 : constant Version_32 := 16#9620c883#;
   pragma Export (C, u00160, "google_creuxS");
   u00161 : constant Version_32 := 16#00047ec5#;
   pragma Export (C, u00161, "lcaB");
   u00162 : constant Version_32 := 16#a78a69e6#;
   pragma Export (C, u00162, "lcaS");
   u00163 : constant Version_32 := 16#58fab764#;
   pragma Export (C, u00163, "sda_exceptionsS");
   u00164 : constant Version_32 := 16#b7ad86d8#;
   pragma Export (C, u00164, "google_naiveB");
   u00165 : constant Version_32 := 16#6dbd34cb#;
   pragma Export (C, u00165, "google_naiveS");
   u00166 : constant Version_32 := 16#a6359005#;
   pragma Export (C, u00166, "system__memoryB");
   u00167 : constant Version_32 := 16#1f488a30#;
   pragma Export (C, u00167, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  system.fat_llf%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%s
   --  system.img_real%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.wch_stw%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  ada.exceptions%s
   --  system.wch_stw%b
   --  ada.exceptions.traceback%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%s
   --  system.memory%s
   --  system.memory%b
   --  ada.exceptions.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.exceptions.machine%s
   --  system.secondary_stack%b
   --  system.address_image%b
   --  ada.exceptions.last_chance_handler%b
   --  system.standard_library%b
   --  ada.exceptions%b
   --  ada.command_line%s
   --  ada.command_line%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools%b
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.val_lli%s
   --  system.val_lli%b
   --  system.val_real%s
   --  system.val_real%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.float_aux%s
   --  ada.text_io.float_aux%b
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.assertions%s
   --  system.assertions%b
   --  ada.assertions%s
   --  ada.assertions%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  sda_exceptions%s
   --  lca%s
   --  lca%b
   --  google_creux%s
   --  google_creux%b
   --  google_naive%s
   --  google_naive%b
   --  pagerank%b
   --  END ELABORATION ORDER


end ada_main;
