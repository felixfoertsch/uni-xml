(: Question:

Search treebank_eng_2.xml for all sentences in which no verb (a verb is token with @upos being equal to VERB or AUX) is in the past tense (i.e., @feats does not contain Tense=Past) in the following way:

 <sentence>For those who follow social media transitions on Capitol Hill, this will be a little different.</sentence>
 <sentence>What she’s saying and what she’s doing, it — actually, it’s unbelievable.</sentence>
 <sentence>Rather than teaching the scientific method as a separate unit, for example, students learn science content by applying it.</sentence>

:)

for $s in doc("../db/treebank_eng_2.xml")//s
where not($s/t[contains(@feats,"Tense=Past")])
return
element sentence {
  text { $s/text }
}