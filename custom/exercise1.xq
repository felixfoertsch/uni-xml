(: Question:

Find all sentences in treebank_eng_1.xml, which contain a token with @lemma = "that" and @upos="DET", and return them like this (the token will be printed in the element </i>):

<results>
...
<s id="en_partut-ud-1019">After <i>that</i> date, any aid found to be incompatible with <i>those</i> guidelines shall be considered as new aid.</s>
...
</results>

:)

declare function local:clean-id($id) {
  let $clean-id := replace($id, "# sent_id = ", "")
  return $clean-id
};

declare function local:clean-content($content) {
  let $clean-content := replace($content, "# text = ", "")
  let $tokenized := tokenize($clean-content)
  
  for $token in $tokenized return
  local:that($token)
  
};

declare function local:that($token) {
  if (contains($token, "that")) then <i>{$token}</i>
  else $token
};

<results>
{
  let $doc := doc("../db/treebank_eng_1.xml")
  let $token := $doc//s/t[@lemma = "that" and @upos="DET"]
  let $sentences := $token/parent::*

  return
  
  for $item in $sentences
  return
  <s id="{local:clean-id($item/m[1])}">
    { local:clean-content($item/m[2]) }
  </s>

}
</results>