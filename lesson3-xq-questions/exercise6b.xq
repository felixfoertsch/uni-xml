(: Question:

Find all sentences where the coordinating conjunction ”and” coordinates two nouns (@upos="NOUN") and return the <text/> of the relevant sentences.

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
    attribute sent_id { $sentence/sent_id },
    attribute text { $sentence/text },
    local:tree($sentence/t, "0") 
  }
};

let $doc := local:tree-wrap(doc("../db/en_pud-ud-test.xml"))

for $s in $doc
where $s/descendant::t[@lemma="and"]/parent::t[@upos="NOUN"]/parent::t[@upos="NOUN"]

return
element text {
  text { $s/@text }
}