(:
1) Find in de_gsd-ud-test.xml all verbs (@upos="VERB") that govern a following subject (look at @deprel) and return the results as you see in result_1.xml.
Tip: if you do not remember the labels for the subject, find them by retrieving the unique values of @deprel using the function distinct-values()
:)

declare option output:indent 'yes';
declare variable $doc := doc("de_gsd-ud-test.xml");

element file {
  for $verb in $doc/t/s/t[@upos="VERB"],
    $t in $verb/../t[@deprel="nsubj"][./@head = $verb/@id]
   
  let $sent_id := replace($verb/../c[1], "# sent_id = ", "")
  let $text := replace($verb/../c[2], "# text = ", "")
  
  count $n
  
  return
  element sentence {
    attribute n { $n },
    attribute sent_id { $sent_id },
    element text_sent { text { $text } },
    element verb { text { $verb/@form } },
    element sub { text { $t/@form } }
  }
}

(:
<file>
  <sentence n="1" sent_id="test-s13">
    <text_sent>Als ich mit meiner Frau und meiner Tante im Oktober 2007 in Norden nach einer Gaststätte suchten, in der man das originelle Gericht "Labskaus" essen könnte, verlief unsere Suche zunächst erfolglos.</text_sent>
    <verb>verlief</verb>
    <sub>Suche</sub>
  </sentence>
  <sentence n="2" sent_id="test-s16">
    <text_sent>Also für eine Nacht reicht es, aber nicht noch einmal.</text_sent>
    <verb>reicht</verb>
    <sub>es</sub>
  </sentence>
  <sentence n="3" sent_id="test-s20">
    <text_sent>An den anderen Tischen sah es nicht besser aus.</text_sent>
    <verb>sah</verb>
    <sub>es</sub>
  </sentence>
...
:)