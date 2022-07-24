(: Question:

Find all sentences where the coordinating conjunction ”and” coordinates two nouns (@upos="NOUN") and return the <text/> of the relevant sentences.

:)

for $and in doc("../db/en_pud-ud-test.xml")//t[@lemma = "and"]
(:where $and/preceding-sibling::*[1]/@upos="NOUN" and $and/following-sibling::*[1]/@upos="NOUN":)
let $firstNoun := $and/ancestor::s/t[@upos = "NOUN" and @id = $and/@head]
let $secondNoun := $and/ancestor::s/t[@upos = "NOUN" and @id = $firstNoun/@head]

return
if ($secondNoun) then $and/ancestor::s/text