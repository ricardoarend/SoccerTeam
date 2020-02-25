

my_role(middle).

{ include("common.asl") }
/* Plans */

// application domain goals
//+!gc <- .print("writing sections...").

+!g14     <-  .print("Passando a bola para um atacante").
+!g16     <-  .print("recebi a bola no lado esquerdo").
-!g17 <-true.
// +!g17      <- .print("recebi a bola no lado dir").
+!g19      <- .print("Decidindo para onde passar a bola").


// conditions to leave missions

@lgss2[atomic]
+goalState(Scheme,vp,_,_,satisfied)
    : .my_name(Me) & commitment(Me,m2,Scheme)
   <- !quit_mission(m2,Scheme).

{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }