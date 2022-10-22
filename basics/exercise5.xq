for $s in doc("mytreebank.xml")//sentence
let $t := $s/token[(@lemma ="go" and @UPOS="VERB")]
where $t
return 
<result id="{$s/sent_id}">
{
$s/text/data(.)
}
</result>