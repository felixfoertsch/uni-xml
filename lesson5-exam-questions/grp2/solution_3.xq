(:
3) Find all sentences in the file treebank_eng.xml which contain a subordinate clause introduced by
"after" (look at @upos to identify the right "after") and return such clauses as shown in result_3.xml (the tokens returned are the ones following "after" and separated by one space by default, regardless of whether there is no space in the original sentence text).
:)

declare variable $doc := doc("../../db/treebank_eng_2.xml");

<text>{
for $s in $doc//s
let $a := $s/t[@form="after"][@upos="SCONJ"]
let $f := $a/following-sibling::t
where $a
return
<sb sent_id="{$s/sent_id}">{$a/@form/data(), $f/@form/data()}</sb>
}</text>