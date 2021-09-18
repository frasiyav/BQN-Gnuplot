⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"

r ← •Makerand 0
data ← +`r.Range¨100⥊0

plt ← Gnuplot "
  title 'Title'
  xtics 0, 25, 100
  xlabel 'Time'
  ytics 0, 10, 100
  mytics 4
  key left 
" 

plt.Plot data‿"with line title 'my data'"
plt.Plot "x/2"
plt.Show @
