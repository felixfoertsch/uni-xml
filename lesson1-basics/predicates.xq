(: Question:

Find all entries <t /> that have the lemma "transition" or "follow" and the upos "NOUN" or "VERB".

:)

let $doc:= doc("../db/treebank_eng_2.xml")

return $doc//t[@lemma=("transition", "follow") and @upos=("NOUN","VERB")]