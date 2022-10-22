(: Find all sentences in File [1] where there is a verb (@upos = "VERB") which governs a prepositional phrase (PP) introduced by the preposition "in" (@upos = "ADP"), as in "# sent_id = en_partut-ud-2018" (Remember how the annotation of PP is performed in Universal Dependencies). Simply return the sentences thus:)

declare variable $doc := doc("treebank_eng_1.xml");

for $s in $doc//s, $t in $s/t
let $verb := $t[@upos="VERB"]
let $verb_id := $verb/@id
let $pp_head := $t[@upos="ADP"]/@head
where $t[@head=data($pp_head)]

return
<s id="{replace($t/../m[1], "# sent_id = ", "")}">{replace($t/../m[2], "# text = ", "")}</s>

(:
<results>
...
 <s id="en_partut-ud-2018">In Shakespeare's late romances, he deliberately returned to a more artificial style, which emphasised the illusion of theatre.</s>
...
<results>
:)