import RH.P5

namespace RH.RouteA

structure PublicationChain where
  arakelovPositivity : RH.PublicationStep
  zeroBridge : RH.PublicationStep
  terminal : arakelovPositivity.statement → zeroBridge.statement → RH.RiemannHypothesis

theorem publish (chain : PublicationChain)
    (h₁ : chain.arakelovPositivity.statement)
    (h₂ : chain.zeroBridge.statement) : RH.RiemannHypothesis :=
  chain.terminal h₁ h₂

end RH.RouteA