for $s in doc("C:\Users\luido\OneDrive\Dokumente\Studium\MA\4.Semester\XQuery\mytreebank.xml")//sentence
let $t := $s/token[(@lemma ="go" and @UPOS="VERB")]
where $t
return 
<result id="{$s/sent_id}">
{
$s/text/data(.)
}
</result>