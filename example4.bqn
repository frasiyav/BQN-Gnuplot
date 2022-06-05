⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"

⟨s,r,b⟩← ⟨10,30,8÷3⟩
F ← {𝕊⟨x,y,z⟩: ⟨s×y-x,y-˜x×r-z,(x×y)-b×z⟩}
_run ← {steps‿dt 𝔽 _𝕣 i: (⊣+dt×𝔽∘⊣)`⌾(<˘)i∾steps‿(≠i)⥊0‿0‿0}
data ← 10000‿0.01 F _run 1‿2‿3

plt ← Gnuplot "
  terminal pngcairo size 1440,900
  output 'example4-output.png'
  title 'Lorenz Atrractor'
  multiplot layout 1,2 margins 0.12, 0.9, 0.18, 0.9 spacing 0.20,0.15 title 'Taken''s Theorem'
  view 70,30
  zrange [0:70]
  xyplane at 0
  xlabel 'X'
  ylabel 'Y'
  zlabel 'Z'
"
plt.Unset "
  key
  colorbox
  xtics
  ytics
  ztics
"

plt.SPlot data‿"using 1:2:3:0 with lines lc palette"
plt.Subplot "
  title 'Reconstruction'
  zrange [-30:40]
  xyplane at -30
  xlabel 'X(t)'
  ylabel 'X(t-o)'
  zlabel 'X(t-2o)'
"

Reconstruct ← {𝕊𝕩:1𝕊𝕩; offset𝕊𝕩:(2×offset)↓⍉>»⍟(𝕨×↕3)𝕩}
rec ← 7 Reconstruct ⊑˘ data

plt.Splot rec‿"using 1:2:3:0 with lines lc palette"

plt.Show @

