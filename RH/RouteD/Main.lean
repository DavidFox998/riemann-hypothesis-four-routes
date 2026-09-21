import RH.P5

namespace RH.RouteD

structure PublicationChain where
  siegelStep : RH.PublicationStep
  symmetryStep : RH.PublicationStep
  terminal : siegelStep.statement → symmetryStep.statement → RH.RiemannHypothesis

theorem publish (chain : PublicationChain)
    (h₁ : chain.siegelStep.statement)
    (h₂ : chain.symmetryStep.statement) : RH.RiemannHypothesis :=
  chain.terminal h₁ h₂

end RH.RouteD