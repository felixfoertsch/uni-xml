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

let $doc := doc("../db/treebank_eng_1.xml")
return
<tree>
{ local:tree-wrap($doc) }
</tree>