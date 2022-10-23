(:
Find all sentences in the file treebank_eng.xml which contain a subordinate clause introduced by "after" (look at @upos to identify the right "after") and return such clauses as shown in result_3.xml (the tokens returned are the ones following "after" and separated by one space by default, regardless of whether there is no space in the original sentence text).
:)
declare option output:indent 'yes';
declare variable $doc := doc("treebank_eng.xml");

element text {
  for $t in $doc//t[@form="after"][@upos="SCONJ"]

  return
  element sb {
    attribute sent_id { $t/../sent_id },
    text {
      $t/@form,
      $t/following-sibling::t/@form
    }
  }
}

(:
<text>
  <sb sent_id="n01013005">after being sacked in July .</sb>
  <sb sent_id="n01029014">after offering to set up a martial arts school in the capital Belgrade .</sb>
  ...
:)