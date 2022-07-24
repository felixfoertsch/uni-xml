for $verb in doc("../db/treebank_eng_1.xml")//t[@upos="VERB"]

let $noun := $verb/ancestor::s/t[@upos=("NOUN", "PROPN") and @head=$verb/@id]

let $in := $verb/ancestor::s/t[@upos="ADP" and @lemma="in" and @head=$noun/@id]

let $text := replace( $in/ancestor::s/m[2], "# text = ", "")

let $id := replace( $in/ancestor::s/m[1], "# sent_id = ", "")

return if($text) then <s id="{$id}">{$text}</s> else ()
