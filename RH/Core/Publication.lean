import RH.Core.Definition

namespace RH

inductive MathematicalStatus
  | established
  | sourceRequired
  | underReview
  deriving DecidableEq, Repr

inductive FormalizationStatus
  | compiled
  | migrated
  | located
  | notYetWired
  deriving DecidableEq, Repr

structure Provenance where
  repository : String
  revision : String
  sourcePath : String
  declaration : String
  reference : Option String := none
  deriving Repr

/-- Publication metadata never changes the proposition being documented. -/
structure PublicationStep where
  label : String
  mathematicalStatus : MathematicalStatus
  formalizationStatus : FormalizationStatus
  provenance : Provenance
  statement : Prop

end RH