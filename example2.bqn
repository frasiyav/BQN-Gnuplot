⟨Gnuplot⟩ ← •Import "Gnuplot.bqn"

_apply ← {s 𝔽_𝕣 a‿b: 𝔽¨s÷˜(s×a)⊸+¨↕1+s×b-a}
F ← {𝕊x‿y: •math.Cos √+´x‿y⋆2}

matrixdata1 ← 5 (•math.Sin·√·+´⋆⟜2) _apply ⟨¯5‿¯5,5‿5⟩
matrixdata2 ← 5 (•math.Cos·√·+´⋆⟜2) _apply ⟨¯5‿¯5,5‿5⟩

plt ← Gnuplot ⟨
  "multiplot layout 1,2 margins 0.07,0.93,0.42,0.85 spacing 0.1,0.1 "
  "pm3d at b"
  "view 60,10"
⟩

plt.Unset ⟨
  "xtics"
  "ytics"
  "ztics"
  "border"
  "colorbox"
⟩

plt.SPlot matrixdata1‿"matrix with lines title ''"

plt.Subplot ⟨
  "colorbox horizontal user size .4, 0.03 origin 0.3,.08"
  "cbtics 0.5"
⟩
plt.SPlot matrixdata2‿"matrix with lines title ''"

plt.Show @
