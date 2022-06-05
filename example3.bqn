⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"

_vecfield ← {s 𝔽_𝕣 a‿b: >⥊(∾⟜𝔽)¨s÷˜(s×a)⊸+¨↕1+s×b-a}
F ← -´÷⟜(+´⋆⟜2)∘+⚇1

vecdata ← 4 (10÷˜⟨1‿¯1,¯1‿1⟩⊸F)_vecfield ⟨¯4‿¯3,4‿3⟩

plt ← Gnuplot "
  xrange [-4:4]
  yrange [-3:3]
  xzeroaxis
  yzeroaxis
  key box height 1 opaque
"

plt.Plot vecdata‿"using 1:2:3:4 with vectors head filled"

plt.Show @
