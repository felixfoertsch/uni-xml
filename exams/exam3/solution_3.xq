(:
3.3) Find all sentences in the file treebank_eng.xml which contain a subordinate clause introduced by "after" (look at @upos to identify the right "after") and return such clauses as shown in result_3.xml (the tokens returned are the ones following "after" and separated by one space by default, regardless of whether there is no space in the original sentence text).
:)

declare variable $doc := doc("treebank_eng.xml");

for $s in $doc//s, $t in $s/t [@upos="SCONJ"][@form="after"]


return
element sb {
  attribute sent_id {},
  text { $t/@form }
}

(:
<text>
  <sb sent_id="n01013005">after being sacked in July .</sb>
</text>
:)