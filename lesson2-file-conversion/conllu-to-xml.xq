(: Question:

Fetch the following CoNLL-U file from the internet, convert it to an XML file, and store it to disk:

https://raw.githubusercontent.com/UniversalDependencies/UD_English-ParTUT/master/en_partut-ud-test.conllu

The columns are the following:

ID: Word index, integer starting at 1 for each new sentence; may be a range for multiword tokens; may be a decimal number for empty nodes.
FORM: Word form or punctuation symbol.
LEMMA: Lemma or stem of word form.
UPOSTAG: Universal part-of-speech tag.
XPOSTAG: Language-specific part-of-speech tag; underscore if not available.
FEATS: List of morphological features from the universal feature inventory or from a defined language-specific extension; underscore if not available.
HEAD: Head of the current word, which is either a value of ID or zero (0).
DEPREL: Universal dependency relation to the HEAD (root iff HEAD = 0) or a defined language-specific subtype of one.
DEPS: Enhanced dependency graph in the form of a list of head-deprel pairs.
MISC: Any other annotation.

:)

file:write("/Users/felixfoertsch/Developer/Uni-Development/uni-xml/db/converted-conllu.xml",

<treebank> {

  let $text := tokenize(fetch:text("https://raw.githubusercontent.com/UniversalDependencies/UD_English-PUD/master/en_pud-ud-test.conllu"), "\n\n")

  for $item in $text
  return
  <s> {
    for $line in tokenize($item, "\n")
    return
      if (starts-with($line, "# sent_id")) then
        <sent_id> { replace($line, "# sent_id = ", "") } </sent_id>
      else if (starts-with($line, "# text")) then
        <text> { replace($line, "# text = ", "") } </text>
      else
        let $token := tokenize($line, "\t")
        return
        <t id="{ $token[1] }" form="{ $token[2] }" lemma="{ $token[3] }"
        upos="{ $token[4] }" xpos="{ $token[5] }" feats="{ $token[6] }"
        head="{ $token[7] }" deprel="{ $token[8] }" deps="{ $token[9] }"
        misc="{ $token[10] }" /> 
  } </s>
} </treebank>)