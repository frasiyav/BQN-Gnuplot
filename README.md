# BQN-Gnuplot
A BQN wrapper script for Gnuplot on linux. Tested on CBQN.

Usage:
------
`make` to build the shared object function which opens a pipe to gnuplot.

Import:
```
⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"
```

Create a plot window:
```
plt ← Gnuplot @
```
When creating a plot you can include 'set' options as either a list of strings or a single string:
```
plt ← Gnuplot ⟨
  "title 'Title'" # use '' instead of "" when needed
  .
  .
  .
⟩

plt ← Gnuplot "
  terminal pngcairo
  output 'output.png'
  .
  .
  .
"
```
Additional plot options can be given with `.Set` and `.Unset`:
```
plt.Set "
  xlabel 'x'
  ylabel 'f(x)'
"

plt.Unset "
  key
"
```
Data is expect as a flat, rank 1 or 2 array, with major cells corresponding to lines in gnuplot's data format:
```
data1 ← >⟨  # points in major cells
  0‿5
  1‿6
  2‿7
  3‿8
⟩  

data2 ← 8‿7‿6‿5

data3 ← >⟨
  1‿2‿3‿4
  1‿3‿5‿7
  1‿4‿7‿10
  1‿5‿9‿13
⟩
```
Use `.Plot` (or `.SPlot` for 3d plot types) to plot the data, giving options as a joined string:
```
plt.Plot data1‿"with lines"
plt.Plot data2             

plt.SPlot data3‿"matrix with lines"
```
Data can also contain strings for uses such as labeling bar charts:
```
stringdata ← >⟨
    "label A"‿3
    "label B"‿7
    "label C"‿5
⟩
plt.Set ⟨"boxwidth 0.5","style fill solid"⟩
plt.Plot stringdata‿"using 2:xtic(1) with boxes"
```
Additionally, functions in strings can be passed to gnuplot to evaluate:
```
plt.Plot "sin(x)"‿"with impulse"
```
Finally, to show the plot:
```
plt.Show @
```
To use Gnuplot's Multiplot features make sure multiplot is set when creating the window:
```
mplt ← Gnuplot "
  multiplot layout 2,1 title 'Multiple plots' font ',20'
"
```
Plot the contents of the first subplot:
```
mplt.Set "title 'Subplot 1'"

mplt.Plot "x**2/10"
mplt.Plot "cos(x)"‿"with points"
```
Then use .Subplot to begin the next plot, after which you can set and unset options specific to that plot.
```
mplt.Subplot "title 'Sub-plot 2'"

mplt.Set "title 'Subplot 2'"
mplt.Unset "key"

mplt.SPlot "x*y"
```
