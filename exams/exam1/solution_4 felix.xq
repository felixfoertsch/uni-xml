(:
Find all verbs and their direct syntactic dependents in the file treebank_eng.xml and group and order them by the number of dependents, as shown in results_4.xml. Verbs are defined such by their @upos value.
:)
declare option output:indent 'yes';
declare variable $doc := doc("treebank_eng.xml");

declare function local:verbs($s) {
  for $s in $doc//s, $verb in $s/t[@upos="VERB"]
  let $deps := $s/t[@head=$verb/@id]
  where $deps

  return
  element verb {
    attribute number_of_dependents { count($deps) },
    attribute sent_id {$s/sent_id},
    attribute text {$s/text},
    element verb_form {
      text { $verb/@form }
    },
    element dependents {
      for $dep in $deps

      return
      element dependent_form {
        text { $dep/@form }
      }
    }
  }
};

<results>
  {
    for $verb in local:verbs($doc)

    group by $nod := $verb/@number_of_dependents
    order by $nod

    return
    element group {
      attribute number_of_dependents { $nod },
      $verb
    }
  }
</results>