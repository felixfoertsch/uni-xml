(:
1.3) Find all sentences in the file treebank_eng.xml which contain a subordinate clause introduced by
"after" (look at @upos to identify the right "after") and return such clauses as shown in result_3.xml (the tokens returned are the ones following "after" and separated by one space by default, regardless of whether there is no space in the original sentence text).
:)

declare variable $doc := doc("treebank_eng.xml");

<text>
{
  for $s in $doc//s, $t in $s/t[@upos="SCONJ"][@form="after"]

  return
  <sb sent_id="{$s/sent_id}">
    { $t/@form/data(), $t/following-sibling::t/@form/data() }
  </sb>
}
</text>