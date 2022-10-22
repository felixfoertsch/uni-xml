(: Question:

Search treebank_eng_2.xml for all sentences in which no verb (a verb is token with @upos being equal to VERB or AUX) is in the past tense (i.e., @feats does not contain Tense=Past) in the following way:

 <sentence>For those who follow social media transitions on Capitol Hill, this will be a little different.</sentence>
 <sentence>What she’s saying and what she’s doing, it — actually, it’s unbelievable.</sentence>
 <sentence>Rather than teaching the scientific method as a separate unit, for example, students learn science content by applying it.</sentence>

:)

declare function local:tree($nodes, $head) {
  for $item in $nodes[@head=$head]
  let $item-id := data($item/@id)
  
  return
  element t {
    attribute id { $item-id },
    attribute lemma { $item/@lemma},
    attribute upos { $item/@upos },
    attribute feats { $item/@feats },
    local:tree($nodes, $item-id)
  }
};

declare function local:tree-wrap($doc) {
  let $sentences := $doc//s
  for $sentence in $sentences
  return
  element s {
    attribute sid { $sentence/sent_id },
    attribute text { $sentence/text },
    local:tree($sentence/t, "0") 
  }
};

let $doc := local:tree-wrap(doc("../db/treebank_eng_2.xml"))

for $s in $doc
where not($s/descendant::*[contains(@feats, "Tense=Past")])

return
element sentence {
  text { $s/@text }
}