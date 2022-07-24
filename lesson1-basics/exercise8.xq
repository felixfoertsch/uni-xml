(:retrieve all the dependents of "work":)
for $s in doc("lab_2022-05-13_treebank.xml")//sentence
let $t := $s/line/token[@lemma="work" and @UPOS="NOUN"]
let $d := $s/line/token[@HEAD = $t/@id]

where $d

return
<result id="[$s/sent_id}">
<text>{data($s/text)}</text>
<head>{$t}</head>
<dep>{$d}</dep>
</result>