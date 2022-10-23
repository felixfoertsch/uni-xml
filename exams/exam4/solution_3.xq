(:
Find all plural nouns (i.e., @upos = "NOUN" and @feats must contain "Number=Plur") not ending in "s" which govern a determiner (i.e, @upos = "DET"), and return them as shown in result_3.xml
:)
declare option output:indent 'yes';
declare variable $doc := doc("./treebank_eng.xml");

<result>
{
for $n in $doc//t[@upos="NOUN"][contains(@feats, "Number=Plur")]
              [not(ends-with(@form, "s"))]
let $d := $n/parent::s/t[@upos="DET"][@head = $n/@id]
where $d
return
<instance sent_id="{$n/parent::s/sent_id}">
<text>{$n/parent::s/text/text()}</text>
<noun>{$n/@form/data(.)}</noun>
<det>{$d/@form/data(.)}</det>
</instance>
}
</result>