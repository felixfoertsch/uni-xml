(:
Find all tokens having a value for "VerbForm" in their @feats, and group them according to these values (for example, "Fin" in  "VerbForm=Fin"), as shown in result_4.xml (note that for each group you have to return each verb having that specific value of VerbForm).
:)
declare option output:indent 'yes';
declare variable $doc := doc("./treebank_eng.xml");

<result>{
let $tokens := for $t in $doc//t[@feats[matches(., "VerbForm")]] return $t

for $t in $tokens
let $verbform := tokenize($t/@feats, "\|")[matches(., "VerbForm")]

group by $verbform

return
element Verbform {
  attribute value { tokenize($verbform, "=")[2] },

  for $item in $t return
  element verb_instance {
    attribute form { $item/@form },
    attribute sent_id { $item/ancestor::s/sent_id },
    text { $item/ancestor::s/text }
  }
}

}</result>
(:
<result>
  <VerbForm value="Fin">
    <verb_instance form="is" sent_id="n01001011">“While much of the digital transition is unprecedented in the United States, the peaceful transition of power is not,” Obama special assistant Kori Schulman wrote in a blog post Monday.</verb_instance>
    <verb_instance form="is" sent_id="n01001011">“While much of the digital transition is unprecedented in the United States, the peaceful transition of power is not,” Obama special assistant Kori Schulman wrote in a blog post Monday.</verb_instance>
    ...
  </VerbForm value="Fin">
</result>
:)