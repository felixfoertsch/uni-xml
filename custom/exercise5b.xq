(: Question:

Search the file en_pud-ud-test.xml for all sentences in which a verb (@upos="VERB") linguistically governs the preposition ”in” (@upos="ADP"), such as in, for example, ”... is unprecedented in the United States...”. Remember that, from the annotation perspective, prepositions are not directly made dependent on a verb (@upos="VERB"), but on another token, which you can assume to be a noun (@upos="NOUN" or @upos="PROPN"), which in turn depends on the verb. Return the <text/> of each relevant sentence:

<text>
While much of the digital transition is unprecedented in the United States, the peacefultransition of power is not, Obama special assistant Kori Schulman wrote in a blog post Monday.
</text>
<text>
But in a break from his past rhetoric about curtailing immigration, the GOP nominee proclaimed that as president he would allow tremendous numbers of legal immigrants based on a merit system.
</text>
<text>
In early October, the transition team used the same venue to meet with technology lobbyists,inviting representatives from Uber, the Motion Picture Association of America, the Consumer Technology Association and other groups.
</text>

:)

let $doc := doc("../db/en_pud-ud-test.xml")

for $verb in $doc//t[@upos="VERB"]
let $noun := $verb/ancestor::s/t[(@upos = "NOUN" or @upos = "PROPN") and @head = $verb/@id]
let $in := $verb/ancestor::s/t[@lemma = "in" and @head = $noun/@id]

return
if ($in) then $verb/ancestor::s/text