for $s in fetch:xml("https://git.informatik.uni-leipzig.de/celano/sose2022/-/raw/main/texts/mytreebank.xml")//sentence

let $t := $s/token[@lemma="work" and @UPOS="NOUN"]

let $d := $s/token[@HEAD = $t/@id]

where $d

return
<result id="{$s/sent_id}">
<text>{data($s/text)}</text>
<head>{$t}</head>
{
 for $a in $d
 return
 <dep>{$a}</dep>
}
</result>