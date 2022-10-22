(:
2) Find all paragraphs in phi0448.phi001.perseus-lat2.xml (i.e., element <p/>) 
which contains the string "Helveti" and return the results in descending order 
as far as the book number is concerned, as shown in result_2.xml (note that 
the descending order only concerns the book numbers, not
the chapter or section numbers).
:)

declare option output:indent 'yes';

declare variable $doc := doc("./phi0448.phi001.perseus-lat2.xml");

element result {
for $p in $doc//*:p
where $p[matches($p, "Helveti")]
let $book := $p/../../..
let $chapter := $p/../..
let $section := $p/..

order by $book/@n descending

return
element instance {
  attribute book { $book/@n },
  attribute chapter { $chapter/@n },
  attribute section { $section/@n },
  text { $p/data() }
}
}

(:
<result>
  <instance book="7" chapter="9" section="6">Hac re cognita Vercingetorix rursus in Bituriges exercitum reducit atque inde profectus Gorgobinam, Boiorum oppidum, quos ibi Helvetico proelio victos Caesar collocaverat Aeduisque attribuerat, oppugnare instituit.</instance>
  <instance book="7" chapter="75" section="3">Senonibus, Biturigibus, Santonis, Rutenis, Carnutibus duodena milia; Bellovacis X; totidem Lemovicibus; octona Pictonibus et Turonis et Parisiis et Helvetiis; [Suessionibus,] Ambianis, Mediomatricis, Petrocoriis, Nerviis, Morinis, Nitiobrigibus quina milia; Aulercis Cenomanis totidem; Atrebatibus [IIII milibus]; Veliocassis, Lexoviis et Aulercis Eburovicibus terna; Rauracis et Boiis bina;</instance>
  
  ...
</result>
:)