declare function local:tree($nodes, $head) {
  for $node in $nodes[@head=$head]
  let $node-id := data($node/@id)
  
  return
  element t {
    attribute id { $node-id },
    attribute lemma { $node/@lemma},
    attribute upos { $node/@upos },
    attribute feats { $node/@feats },
    local:tree($nodes, $node-id)
  }
};

declare function local:tree-wrap($doc) {
  let $sentences := $doc//s
  for $sentence in $sentences
  return
  element s {
    attribute sent_id { local:clean-id($sentence/m[1]) },
    (:  attribute sent_id { $sentence/sent_id }, :)
    attribute text { local:clean-content($sentence/m[2]) },
    (:  attribute text { $sentence/text }, :)
    local:tree($sentence/t, "0") 
  }
};

declare function local:clean-id($id) {
  replace($id, "# sent_id = ", "")
};

declare function local:clean-content($content) {
  replace($content, "# text = ", "")
};

let $doc := doc("../db/treebank_eng_1.xml")

return
element tree { 
  local:tree-wrap($doc)
}
