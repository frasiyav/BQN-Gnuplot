⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"

r ← •Makerand 0
data3d1 ← +`+`˘r.Range¨25‿25⥊0
data3d2 ← +`+`˘1-˜2×r.Range¨25‿25⥊0

plt ← Gnuplot ⟨
  "title '3D Plot' font 'Times New Roman,24'"
  "ztics -100, 100, 500"
  "terminal pngcairo"
  "output 'output.png'"
⟩

plt.SPlot data3d1‿"matrix with lines"
plt.Splot data3d2‿"matrix with dots"

plt.Show @
