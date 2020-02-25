 
my_role(back).

{ include("common.asl") }

/* Plans */

// application domain goals

+!g6 <- .print("Estou com a Bola").
+!g7 <- .print("Passei para o meio esquerdo").
-!g8 <-true.
//+!g8 <- .print("Passei para o meio dir").


// when my goal in the scheme is satisfied, leave my mission

@lqm[atomic]
+goalState(Scheme,ts,_,_,satisfied)
    : .my_name(Me) & commitment(Me,m1,Scheme)
   <-!quit_mission(m1, Scheme).


// plans to handle obligations

// only commits to m1!

+permission(Ag,Norm,committed(Ag,m1,Scheme),Deadline)[artifact_id(ArtId),workspace(_,_,W)]
    : .my_name(Ag)
   <- .print("I have permission to commit to m1 on ",Scheme,"... doing so");
      commitMission(m1)[artifact_name(Scheme), wid(W)].

+obligation(Ag,Norm,committed(Ag,Mission,Scheme),Deadline)
    : .my_name(Ag)
   <- .print("Ignoring obligation to commit to ",Mission," on ",Scheme).

{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }