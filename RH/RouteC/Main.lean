import RH.Core

namespace RH.RouteC

structure PublicationChain where
  growthStep : RH.PublicationStep
  repulsionStep : RH.PublicationStep
  terminal : growthStep.statement → repulsionStep.statement → RH.RiemannHypothesis

theorem publish (chain : PublicationChain)
    (h₁ : chain.growthStep.statement)
    (h₂ : chain.repulsionStep.statement) : RH.RiemannHypothesis :=
  chain.terminal h₁ h₂

end RH.RouteC