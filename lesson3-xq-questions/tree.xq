declare function local:tree($nodes, $head) {
  for $item in $nodes[@head=$head]
  let $item-id := data($item/@id)
  
  return
  element node {
    attribute id { $item-id },
    attribute lemma { $item/@lemma},
    local:tree($nodes, $item-id)
  }
};

let $doc := doc("../db/treebank_eng_1.xml")

return local:tree($doc//s[2]/t, 0)