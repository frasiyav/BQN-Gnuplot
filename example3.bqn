⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"

r ← •Makerand 0
•Show data3d ← (↕∘≠∾˘⊢)+`1-˜2×r.Range¨50‿2⥊0

plt ← Gnuplot "
  title 'Multiple Plots'
  multiplot layout 2,1
"

⟨"title 'Plot 1'"⟩ plt.Multiplot ⟨data3d‿"using 1:2 with lines"⟩
plt.MultiSplot´ ⟨"title 'Plot 2'"⟩‿⟨data3d‿"with impulses",data3d‿"with points"⟩
plt.Show @
