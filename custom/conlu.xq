file:write("/Users/felixfoertsch/basex/files/converted-conllu.xml",

<treebank> {

let $text := tokenize(fetch:text("en_partut-ud-test.conllu"), "\n\n")

for $item in $text return
<sentence>
{
  for $line in tokenize($item, "\n") return

    if (starts-with($line, "# sent_id")) then
      <sent_id> { replace($line, "# sent_id = ", "") } </sent_id>
    else if (starts-with($line, "# text")) then
      <text> { replace($line, "# text = ", "") } </text>
    else
      let $token := tokenize($line, "\t")
      return
      <token
        id="{ $token[1] }"
        form="{ $token[2] }"
        lemma="{ $token[3] }"
        UPOS="{ $token[4] }"
        XPOS="{ $token[5] }"
        FEATS="{ $token[6] }"
        HEAD="{ $token[7] }"
        DEPREL="{ $token[8] }"
        DEPS="{ $token[9] }"
        c10="{ $token[10] }"
       /> 
}
</sentence>
}

</treebank>)