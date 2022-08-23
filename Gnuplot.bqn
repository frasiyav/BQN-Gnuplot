Gnuplotpipe ← {𝕊𝕩:
  popen ← @ •FFI ⟨"*:i32","popen","*i32:c8","*i32:c8"⟩
  fputs ← @ •FFI ⟨"i32","fputs","*i32:c8","*:i32"⟩
  pclose ← @ •FFI ⟨"i32", "pclose",">*:i32"⟩
  fp ← POpen ⟨"gnuplot --persist"∾@,"w"∾@⟩
  FPuts ⟨𝕩∾@,fp⟩
  PClose fp
}

lf ← @+10
IsStr  ← (1==)◶0‿(∧´2=•Type¨)
AssertStr ← ("Expected string, got: "∾•Repr)!IsStr
Split ← (⊢-˜+`×¬)∘=⊔⊢
Join ← {∾1↓⥊(<𝕨)≍˘𝕩}
Replace ← {a‿b𝕊𝕩: b¨⌾((a=𝕩)⊸/)𝕩}
FmtData ← ("¯-"Replace ' 'Join •Repr¨)¨ <˘⍟(1<=)
Clean ← """'" Replace ((∨`∧∨`⌾⌽)' '⊸≠)⊸/

Gnuplot ⇐ {𝕊 options:

  ParseList ← {𝕊@:""; Clean¨∾´⚇¯1(0≠≠¨)⊸/(lf Split AssertStr⊸⊢)⚇1𝕩}

  Plt ← {

    sets‿unsets‿fns‿sfns‿data ← 5/⋈⟨⟩

    S  ⇐ {sets  ∾↩   "set "⊸∾¨ParseList 𝕩} ⋄ S 𝕩
    US ⇐ {unsets∾↩ "unset "⊸∾¨ParseList 𝕩}

    Add ← (∾⟜<¨)⟜{
      𝕊f‿o:
        ¬1‿1≡•Type¨𝕩?
          AssertStr o
          ∾⟜(' '∾o)⌾⊑𝕊f;
          𝕊a‿b: "'-'"‿𝕩;
      IsStr 𝕩?
        ⋈⟜⟨⟩𝕩;
        "Data not flat"!(3⌊≡)◶⟨0,1,∧´·⥊IsStr¨∨·¬≡¨,0⟩𝕩
        "Data rank > 2" !2≥=𝕩
        "'-'"⋈𝕩
    }

    E ← "Mixing Plot and SPlot"!·¬≠
    P  ⇐ {E sfns ⋄ fns‿data Add↩𝕩}
    SP ⇐ {E fns ⋄ sfns‿data Add↩𝕩}

    Fmt ⇐ {𝕤⋄∾⟨
      sets∾unsets
      <∾"plot "‿"splot "(⊣∾⍟(×≠∘⊢)", " Join ⊢)¨fns‿sfns
      ∾(FmtData∾·<"e"˙)¨(0≠≠¨)⊸/data
    ⟩}
  }
  
  plts ← ⟨Plt options⟩
  SubPlot ⇐ {plts∾↩ Plt 𝕩}
  Plot    ⇐ {(⊢´plts).P  𝕩}
  SPlot   ⇐ {(⊢´plts).SP 𝕩}
  Set     ⇐ {(⊢´plts).S  𝕩}
  UnSet   ⇐ {(⊢´plts).US 𝕩}

  Format ← lf Join ·∾{𝕩.Fmt @}¨
  Show  ⇐ {𝕤⋄ Gnuplotpipe lf∾˜Format plts}
  Debug ⇐ {𝕤⋄ •Show Format plts}
}
