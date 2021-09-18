# BQN-Gnuplot
A BQN wrapper script for Gnuplot on linux

Usage:
------
Import:
```
⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"
```

Create a plot window:
```
plt ← Gnuplot ⟨
  # List the 'set' options, using '' instead of "" for options that require quotes
  "title 'Title'"
  .
  .
  .
⟩
```
You can also use a single string and newlines instead of a list of strings:
```
plt ← Gnuplot "
  title 'title'
  .
  .
  .
"
```
Plot some data:
```
data1 ← >⟨0‿5,1‿6,2‿7,3‿8⟩  # data is expected as points in major cells
plt.Plot data1‿"with lines" # options given as a joined string

data2 ← 8‿7‿6‿5
plt.Plot data2              # you can plot multiple data or function at once
```
Or plot a function:
```
plt.Plot "sin(x)"‿"with impulse"
```
Show the plot:
```
plt.Show @
```
For 3d/splots use `.SPlot` instead:
```
plt.SPlot "x*y"
```

To use Gnuplot's Multiplot features make sure multiplot is set when creating the window:
```
mplt ← Gnuplot "
  title 'Multiple plots'
  multiplot layout 2,1
"
```
Then use `.MultiPlot` and `.MultiSPlot`:
```
# MultiPlot takes sub-plot specific 'set' options as 𝕨 and a list of functions to plot as 𝕩
⟨"title 'Sub-plot 1'"⟩ mplt.Multiplot ⟨"x**2/10","cos(x)"‿"with points"⟩
mplt.MultiSPlot´ ⟨"title 'Sub-plot 2'"⟩‿⟨"x*y"⟩

```
