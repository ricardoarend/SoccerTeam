 

my_role(attacker).

{ include("common.asl") }

/* Initial goals */

!create.

/* Plans */

+!create
  <- .my_name(Me);
     createWorkspace(ora4mas);
     joinWorkspace(ora4mas,O4MWsp);

     makeArtifact(myorg, "ora4mas.nopl.OrgBoard", ["../SoccerTeam/src/org/st-os.xml"], OrgArtId)[wid(O4MWsp)];
     focus(OrgArtId);

     createGroup("devgrp", stgroup, GrArtId);
     debug(inspector_gui(on))[artifact_id(GrArtId)];
     setOwner(Me);

     .print("group created");

     ?play(roberto,goalkeeper,devgrp);
     // wait for alice
     ?play(lucas,middle,devgrp);

     // wait for carol
     ?play(mateus,back,devgrp);

     !run_scheme(sch1).

//+group(_,_,AID)  <- focus(AID).
//+scheme(_,_,AID) <- focus(AID).

// general error handler for goal start
-!start[error(I),error_msg(M)] <- .print("failure in starting! ",I,": ",M).

+!run_scheme(S)
   <- createScheme(S, marcarGol, SchArtId);
      debug(inspector_gui(on))[artifact_id(SchArtId)];
      .print("scheme ",S," created");
      addScheme(S)[artifact_name("devgrp")];
      .print("scheme is linked to responsible group");
      commitMission(m3)[artifact_id(SchArtId)].
-!run_scheme(S)[error(I),error_msg(M)] <- .print("failure creating scheme ",S," -- ",I,": ",M).

// application domain goals
+!g18 <- .print("Posicionando para receber o passe"). 
//+!g20 <- .print("Chutei no lado esquerdo do gol").
-!g20 <-true.
+!g21 <- .print("Chutei no lado direito do gol").


/* 
+goalState(sch1, cs, _, _, satisfied)
   <- .wait(1000);
      destroyScheme(sch1);
      .print("Começando um novo Projeto ...");
      !!run_scheme(sch2).
*/

+?play(A,R,G) <- .wait({+play(_,_,_)},100,_); ?play(A,R,G).

// signals
+normFailure(N)  <- .print("norm failure event: ", N).
+destroyed(Art)  <- .print("Artifact ",Art," destroyed").

// for debug (prints out the new states of goals)
//+goalState(Sch,Goal,CommittedAgs,AchievedBy,State)
//   <- .print("                         goal changed: ", goalState(Sch,Goal,CommittedAgs,AchievedBy,State)).

{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }