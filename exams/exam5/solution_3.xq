(:
3) 
The file tlg0006.tlg003.perseus-grc2.tok01_lemma01.xml contains Greek lemmas in
@value. Group the token references in @xlink:href by those lemmas,
so that you get the output in result_3.xml. 

Tip: The attribute @xlink:href is in a namespace, and 
therefore you can refer to it in a query as @*:href.
:)

declare option output:indent 'yes';
declare variable $doc := doc("tlg0006.tlg003.perseus-grc2.tok01_lemma01.xml");

element file {
  for $p in $doc//feat
  
  group by $group := $p/@value
  
  return
  element forms {
    attribute lemma { $group },
    text { $p/@*:href }
  }
}


(:
<file>
  <forms lemma="εἴθς">#tok_1</forms>
  <forms lemma="ὦ">#tok_2 #tok_4 #tok_16 #tok_26 #tok_43 #tok_58 #tok_118 #tok_128 #tok_166 #tok_168 #tok_185 #tok_187 #tok_189 #tok_216 #tok_223 #tok_257 #tok_262 #tok_274 #tok_278 #tok_291 #tok_297 #tok_300 #tok_332 #tok_362 #tok_364 #tok_402 #tok_404 #tok_411 #tok_431 #tok_439 #tok_441 #tok_460 #tok_541 #tok_549 #tok_575 #tok_577
  
:)