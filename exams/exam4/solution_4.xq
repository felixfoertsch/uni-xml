(:4) Find all tokens having a value for "VerbForm" in their @feats, 
and group them according to these values (for example, "Fin" in  "VerbForm=Fin"), 
as shown in result_4.xml (note that for each group you have to return 
each verb having that specific value of VerbForm).:)

declare option output:indent 'yes';
declare variable $doc := doc("./treebank_eng.xml");

<result>{
for $n in $doc//t[contains(@feats, "VerbForm")]
let $f := for $h in tokenize($n/@feats, "\|")
          where contains($h, "VerbForm")
          return replace($h, "VerbForm=", "")
group by $g := $f
return
<VerbForm value="{$g}">
{ for $i in $n
  let $s := $i/parent::s
  return
  <verb_instance form="{$i/@form/data(.)}" 
                 sent_id="{$s/sent_id}">{$s/text/text()}
  </verb_instance>
}
</VerbForm>
}</result>