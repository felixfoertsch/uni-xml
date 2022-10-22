doc("C:\Users\luido\OneDrive\Dokumente\Studium\MA\4.Semester\XQuery\mytreebank.xml")//sentence
let $t := $s/token[(@lemma ="work" and @UPOS="NOUN")]
let $d := $s/token[@HEAD= $t/@id]
where $d
return 
<result id="{$s/sent_id}">
<text>{data($s/text)}</text>
<head>{$t}</head>
<dep>{$d}</dep>
</result>