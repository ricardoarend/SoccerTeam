
my_role(goalkeeper).

{ include("common.asl") }


// application domain goals

+!g6 <- .print("Estou com a Bola").
+!g7 <- .print("Passei para o meio esq").
+!g8 <- .print("Passei para o meio dir").



{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$jacamoJar/templates/org-obedient.asl") }