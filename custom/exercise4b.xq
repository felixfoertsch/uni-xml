(: Question:

Search the file to group all sentence ids (<sent_id/>) by the lemmas (@lemma) of subordinate conjunctions (@upos="SCONJ").

To state this differently, you search the file for all subordinate conjunctions (@upos="SCONJ") and then group the sentence ids by the lemmas of those subordinate conjunctions. The groups are also alphabetically ordered by the lemmas, as shown in the following result:

<g lemma="about">
<sent_id>n01040028</sent_id>
<sent_id>n01042004</sent_id>
<sent_id>n01106008</sent_id>
<sent_id>n01129017</sent_id>
<sent_id>n02075020</sent_id>
</g>

:)

declare variable $doc := doc("../db/treebank_eng_2.xml");

declare function local:getSentences($lem) {
  let $sentences := $doc//t[@upos = "SCONJ" and @lemma = $lem]/ancestor::s
  
  return
  <g lemma="{$lem}"> {
  for $sentence in $sentences return$sentence/sent_id }
  </g>
};



for $lemma in distinct-values($doc//t[@upos = "SCONJ"]/@lemma)
order by $lemma

return
local:getSentences($lemma)