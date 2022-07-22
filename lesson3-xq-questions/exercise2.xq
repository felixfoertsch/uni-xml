(: Question:

Find all sentences in treebank_eng_1.xml containing a verb (@upos = "VERB") that governs a prepositional phrase (PP) introduced by the preposition "in" (@upos = "ADP"). Example from "# sent_id = en_partut-ud-2018" (Remember how the annotation of PP is performed in Universal Dependencies). Simply return the sentences thus: 

<results>
...
 <s id="en_partut-ud-2018">In Shakespeare's late romances, he deliberately returned to a more artificial style, which emphasised the illusion of theatre.</s>
...
<results>

:)

declare function local:tree($nodes, $head) {
  for $item in $nodes[@head=$head]
  let $item-id := data($item/@id)
  
  return
  element t {
    attribute id { $item-id },
    attribute lemma { $item/@lemma},
    attribute upos { $item/@upos },
    local:tree($nodes, $item-id)
  }
};

declare function local:tree-wrap($doc) {
  let $sentences := $doc//s
  for $sentence in $sentences
  return
  element s {
    attribute sid { local:clean-id($sentence/m[1]) },
    attribute text { local:clean-content($sentence/m[2]) },
    local:tree($sentence/t, "0") 
  }
};

declare function local:clean-id($id) {
  replace($id, "# sent_id = ", "")
};

declare function local:clean-content($content) {
  replace($content, "# text = ", "")
};

let $doc := local:tree-wrap(doc("../db/treebank_eng_1.xml"))

return

for $s in $doc
where $s/t[@upos="VERB"]/descendant::*[@upos="ADP" and @lemma="in"]

return
element s {
  attribute id { $s/@sid },
  text { $s/@text }
}