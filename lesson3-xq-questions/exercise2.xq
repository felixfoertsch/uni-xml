(: Question:

Find all sentences in treebank_eng_1.xml containing a verb (@upos = "VERB") that governs a prepositional phrase (PP) introduced by the preposition "in" (@upos = "ADP"). Example from "# sent_id = en_partut-ud-2018" (Remember how the annotation of PP is performed in Universal Dependencies). Simply return the sentences thus: 

<results>
...
 <s id="en_partut-ud-2018">In Shakespeare's late romances, he deliberately returned to a more artificial style, which emphasised the illusion of theatre.</s>
...
<results>

:)
<results>
{
  let $doc := doc("../db/treebank_eng_1.xml")
  let $sentences := $doc//s
  
  for $sentence in $sentences
  let $verb := $sentence/t[@upos="VERB"]
  let $adp := $sentence/t[@upos="ADP" and @lemma="in" and @deprel="case"]
  
  let $sent-id := replace($adp/../m[1], "# sent_id = ", "")
  where $verb and $sent-id
  
  let $text := replace(data($adp/../m[2]), "# text = ", "")
  
  return
  <s id="{$sent-id}">{$text}</s>
}
</results>