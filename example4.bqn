⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"

plt ← Gnuplot "
  title 'Multiple plots'
  multiplot layout 2,1
"
⟨"title 'Sub-plot 1'"⟩ plt.Multiplot ⟨"x**2/10","cos(x)"‿"with points"⟩
plt.MultiSPlot´ ⟨"title 'Sub-plot 2'"⟩‿⟨"x*y"⟩
plt.Show @
