IsStr  ← (1==)◶0‿(∧´2=•Type¨)
AssertStr ← ("Expected string, got: " ∾•Repr)!IsStr
StrSplit ← (⊢-˜+`×¬)∘=⊔⊢
StrFmt ← '%'{𝕗{∾1(↑∾·⥊𝕩≍˘↓)𝕨⊔˜(1-˜∾⟜0¬⊸×1+`∾⟜1)𝕗=𝕨}⟜(<⍟(2-≡))}
Replace ← {a‿b𝕊𝕩: b¨⌾((a=𝕩)⊸/)𝕩}
FmtData ← (⟨"¯-","‿ "⟩Replace´˜•Repr)¨ <˘⍟(1<=)

Gnuplot ⇐ {𝕊 options:

  Set ← {∾{"set "∾𝕩∾"; "}¨∾⍟(≡-2˙)(0≠≠¨)⊸/((@+10)StrSplit AssertStr⊸⊢)⚇1 𝕩}

  path ← •wdpath
  fileName ← {𝕊n: tc←0 ⋄ {𝕊⍟(⊑⊢<⊸∊•file.List∘path) n StrFmt •Repr tc+↩1}} "temp_data%.txt"
  tmpFiles ← {
    files ← 2‿0⥊⟨⟩
    Add ⇐ {files ∾˘↩ (n ← path ∾ '/' ∾ FileName @) ∾○< FmtData 𝕩 ⋄ "'"∾n∾"'"}
    Write  ⇐ {𝕤 ⋄ •file.Lines¨˝files}
    Remove ⇐ {𝕤 ⋄ •Sh "rm"<⊸∾ ⊏files}
  }

  plt ← {
    plots ← ⟨(Set options)‿""‿""⟩
    Pfx ← {
      plots{""⊸≡◶⟨⊢⊣"mixing plot and splot"!𝕩⊸≡, 𝕩⊸∾⟩⌾(1⊑¯1⊑⊢)𝕨}↩ 𝕩
    }
    Add ⇐ {plots{∾⟜𝕩⌾(2⊑¯1⊑⊢)𝕨}↩𝕩}','∾˜{
      𝕨𝕊f‿o: (𝕨𝕊f)∾' '∾AssertStr⊸⊢o;
      Pfx 𝕨
      IsStr◶tmpFiles.Add‿⊢ 𝕩
    } 
    MultiAdd ⇐ {𝕊ptype:{ 
      plots∾⟜<↩𝕨(""‿""∾˜⟜<""⊘(Set ⊣))𝕩
      ptype⊸Add¨𝕩
    }}
    Fmt ⇐ {𝕤⋄ ∾';'∾´¨plots}
  }
  plot‿sPlot ⇐ {𝕩⊸plt.Add}¨"plot "‿"splot "
  multiPlot‿multiSPlot ⇐ plt.MultiAdd¨"plot "‿"splot "

  Show ⇐ {𝕤
    tmpFiles.Write @
    •Show 1⊑ •Sh "gnuplot"‿"-p"‿"-e"∾⟜<plt.Fmt @
    tmpFiles.Remove @
  }
  Debug ⇐ {𝕤 ⋄ •Show plt.Fmt @}
}
