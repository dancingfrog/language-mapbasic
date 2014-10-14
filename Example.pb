EnableExplicit

; This source codes makes no sense and only serves to proof the language grammar
; of the package was written right.

Structure Rectangle
  X.i
  Y.i
  Width.f
  Height.f
EndStructure

#Limit = 1234

Global Iterator

Procedure SimpleProcedureDeclaration()

EndProcedure

Procedure.s ComplexProcedureDeclaration(With.s = "Default Value", #AndOtherStuff)

  Protected SomeVariable.i, *Pointer

  ComposedString = "Containing" + "Keywords like Procedure or Repeat" ;!

EndProcedure

Global *Address = @SimpleProcedureDeclaration()

Repeat

  ; Some nested calls.
  Add(One, Multiply("Two", Three\Four))

Until Iterator = #Limit
