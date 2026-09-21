import RH.P5

namespace RH.RouteB

structure PublicationChain where
  spectralStep : RH.PublicationStep
  descentStep : RH.PublicationStep
  terminal : spectralStep.statement → descentStep.statement → RH.RiemannHypothesis

theorem publish (chain : PublicationChain)
    (h₁ : chain.spectralStep.statement)
    (h₂ : chain.descentStep.statement) : RH.RiemannHypothesis :=
  chain.terminal h₁ h₂

end RH.RouteB