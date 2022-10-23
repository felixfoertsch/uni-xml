(:
Find all verbs and their direct syntactic dependents in the file treebank_eng.xml and group and order them by the number of dependents, as shown in results_4.xml. Verbs are defined such by their @upos value.
:)
declare option output:indent 'yes';
declare variable $doc := doc("treebank_eng.xml");

element results {
  for $verb in $doc//t[@upos="VERB"]

  let $dependents := $verb/../t[@head = $verb/@id]

  where $dependents
  group by $count := count($dependents)
  order by $count ascending

  return
  element group {
    attribute number_of_dependents { $count },
    for $v in $verb
    return
    element verb {
      attribute number_of_dependents { $count },
      attribute sent_id { $v/../sent_id },
      attribute text { $v/../text },
      element verb_form {
        text {$v/@form }
      },
      element dependents {
        for $t in $v/../t[@head = $v/@id]
        return
        element dependent_form {
          text { $t/@form }
        }
      }
    }
  }
}

(:
<results>
  <group number_of_dependents="1">
    <verb number_of_dependents="1" sent_id="n01002017" text="But in a break from his past rhetoric about curtailing immigration, the GOP nominee proclaimed that as president he would allow “tremendous numbers” of legal immigrants based on a “merit system.”">
      <verb_form>based</verb_form>
      <dependents>
        <dependent_form>system</dependent_form>
      </dependents>
    </verb>
    <verb number_of_dependents="1" sent_id="n01002032" text="“So I hate to put a little pressure on you, but the fate of the republic rests on your shoulders,” he told the crowd gathered on a sports field at the University of North Carolina.">
    ...
:)