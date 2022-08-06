(:
4) Find all verbs and their direct syntactic dependents in the file treebank_eng.xml and group and order them by the number of dependents, as shown in results_4.xml. Verbs are defined such by their @upos value.
:)

declare variable $doc := doc("../../db/treebank_eng_2.xml");

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

  
  