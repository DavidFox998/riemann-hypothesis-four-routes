import RH.Core

namespace RH.P5

/-- P5's publication boundary. Source theorems are migrated behind these named
interfaces without making Mathlib availability part of their mathematical status. -/
structure BridgeInput where
  terminalStep : RH.PublicationStep
  provesRH : terminalStep.statement → RH.RiemannHypothesis

end RH.P5