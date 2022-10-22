(:
Find all sentences in File [1], which contain a token with @lemma = "that" and @upos="DET", and return them thus (the token will be printed in the element </i>)
:)

declare variable $doc := doc("treebank_eng_1.xml");

let $filter := for $s in $doc//s, $t in $s/t[@lemma="that"][@upos="DET"]
let $sent_id := replace($s/m[1], "# sent_id = ", "")
let $text := replace($s/m[2], "# text = ", "")

return
element s {
  attribute id { $sent_id },
  text { $text },
  element replace {
    $t/@form
  }
}

let $trick := for $item in $filter/text() return $item

return
$trick


(:
<results>
...
<s id="en_partut-ud-1019">After <i>that</i> date, any aid found to be incompatible with <i>those</i> guidelines shall be considered as new aid.</s>
...
</results>
:)