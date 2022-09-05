declare variable $doc := doc("treebank_eng.xml");

<results>{
let $f:=   for $v in $doc//t[@upos="VERB"]
           let $dep := $v/parent::s/t[@head = $v/@id]
           where $dep
           let $count := count($dep)
           return
           <verb number_of_dependents="{$count}" sent_id="{$v/parent::s/sent_id}"
              text="{$v/parent::s/text}">
           <verb_form>{$v/@form/data()}</verb_form>
           <dependents>{for $r in $dep return <dependent_form>{$r/@form/data()}</dependent_form>}</dependents>
           </verb>  
for $h in $f
group by $d := $h/@number_of_dependents
order by $d
return
<group number_of_dependents="{$d}">
{
  $h
}
</group>
}</results>

  
  