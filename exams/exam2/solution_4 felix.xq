(:
4) Find all verbs and their direct syntactic dependents in the file treebank_eng.xml and group and order them by the number of dependents, as shown in results_4.xml. Verbs are defined such by their @upos value.
:)

declare variable $doc := doc("treebank_eng.xml");

declare function local:verb($s) {
  for $verb in $s/t[@upos="VERB"]
  let $verb_id := $verb/@id
  let $dep := $s/t[@head=$verb_id]
  where $dep
  
  return
  <verb number_of_dependents="{count($dep)}" sent_id="{$s/sent_id}" text="{$s/text}">
      <verb_form>{$verb/@form/data()}</verb_form>
      <dependents>
        {
          for $item in $dep
          
          return
          <dependent_form>{$item/@form/data()}</dependent_form>
        }
                
      </dependents>
    </verb>
};
<results>
{
  for $s in $doc//s, $verb in local:verb($s)
  
  group by $nod := $verb/@number_of_dependents
  order by $nod
  
  return
  <group number_of_dependents="{$nod}">
    {
      $verb
    }
  </group>
}
</results>

(:
<group number_of_dependents="9">
    <verb number_of_dependents="9" sent_id="n01005024" text="“We face a lot of competition, and we think transit can help,” said Joe Sternlieb, president of the Georgetown BID.">
      <verb_form>face</verb_form>
      <dependents>
        <dependent_form>“</dependent_form>
        <dependent_form>We</dependent_form>
      </dependents>
    </verb>
</group>
:)