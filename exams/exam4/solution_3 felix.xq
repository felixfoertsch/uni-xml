(:3) Find all plural nouns (i.e., @upos = "NOUN" and @feats must contain "Number=Plur") not ending in "s" which govern a determiner (i.e, @upos = "DET"), and return them as shown in result_3.xml:)

declare option output:indent 'yes';


declare variable $doc := doc("./treebank_eng.xml");

element result {
for $noun in $doc//t[@upos="NOUN"][matches(@feats, "Number=Plur")]
where not(ends-with($noun/@form, "s"))

let $noun-id := $noun/@id/data()
let $det := $noun/ancestor::s/t[@upos="DET"][@head=$noun-id]

where $det

return
element instance {
  attribute sent_id { $noun/../sent_id },
  $noun/../text,
  element noun { $noun/@form/data() },
  element det { $det/@form/data() }
}
}

(:

:)

(:
<result>
  <instance sent_id="n01012003">
    <text>First one of the Yazidi women started crying, then one of her friends.</text>
    <noun>women</noun>
    <det>the</det>
  </instance>
  <instance sent_id="n01053008">
    <text>"Some men get it and Bono is one of those guys," Leive said in a recent interview.</text>
    <noun>men</noun>
    <det>Some</det>
  </instance>
:)