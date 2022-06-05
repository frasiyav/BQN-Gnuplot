⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"

_riemann ← {n 𝔽 _𝕣 a‿b:
  w←n÷˜b-a
  w⋈∾⟜𝔽˘(w÷2)+a+w×↕n
}

F ← {+´3‿¯3‿6‿¯3‿0.4×𝕩⋆↕5}
width‿rects ← 15 F _riemann 0‿5
area ← +´width×1⊏˘rects

plt ← Gnuplot "
  title 'Riemann sum' font ',18'
  xrange [0:5]
  yrange [-4:10]
"

plt.Plot "3-3*x+6*x**2-3*x**3+0.4*x**4"‿"lw 2 lc rgb 'black'"

plt.Set "boxwidth "∾•Fmt width
plt.Plot rects‿"using 1:2 with boxes fillstyle pattern 5 title ''"
plt.Set "label 'Approximate area = "∾(•Fmt area)∾"' at 1,-2"

plt.Show @
