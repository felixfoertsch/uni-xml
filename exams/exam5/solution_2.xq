(:
2)
Find all tokens with @upos="SCONJ" in de_gsd-ud-test.xml , i.e., a subordinate conjunction. Return the content of the subordinate clause that such subordinate conjunction introduces: you can assume that the content consists of any token which follows the subordinate conjunction in linear order.

You also have to distinguish if the subordinate clause follows or precedes its superordinate clause: you can assume this by looking at the position of the subordinate conjunction with respect to the position of the verb of the superordinate clause. If the subordinate conjunction follows it, then you get a "following subordinate clause", otherwise you have a "preceding subordinate clause". 

To find the verb of the superordinate clause follows this logic: for each subordinate conjunction find its governing verb and the governing verb of this governing verb.

:)

declare option output:indent 'yes';
declare variable $doc := doc("de_gsd-ud-test.xml");

for $sconj in $doc/t/s/t[@upos="SCONJ"], $t in $sconj/../t

where $sconj/@head = $t/@id

return
$sconj



(:
<file>
  <case id="1" sent_id="# sent_id = test-s2" sent_text="">
    <preceding_sub_clause sconj="weil">weil mir das Tauchen so gefiel hab ich dort noch im in dem selben Jahr den AOWD und den Deep drangehängt .</preceding_sub_clause>
  </case>
  <case id="2" sent_id="# sent_id = test-s13" sent_text="# text = Als ich mit meiner Frau und meiner Tante im Oktober 2007 in Norden nach einer Gaststätte suchten, in der man das originelle Gericht &quot;Labskaus&quot; essen könnte, verlief unsere Suche zunächst erfolglos.">
    <preceding_sub_clause sconj="Als">Als ich mit meiner Frau und meiner Tante im in dem Oktober 2007 in Norden nach einer Gaststätte suchten , in der man das originelle Gericht " Labskaus " essen könnte , verlief unsere Suche zunächst erfolglos .</preceding_sub_clause>
  </case>
  <case id="3" sent_id="# sent_id = test-s14" sent_text="# text = Als wir dann Schritt für Schritt durch den Versicherungsbogen gingen, wurden die Hälfte der von mir gemachten Angaben nur fehlerhaft oder gar nicht übernommen.">
    <preceding_sub_clause sconj="Als">Als wir dann Schritt für Schritt durch den Versicherungsbogen gingen , wurden die Hälfte der von mir gemachten Angaben nur fehlerhaft oder gar nicht übernommen .</preceding_sub_clause>
  </case>
  <case id="4" sent_id="# sent_id = test-s29" sent_text="# text = Auch für Probetermine nimmt sie sich sehr viel Zeit und zeichnet alles genaustens vor, so dass man sich vorstellen kann, wie das Ergebnis ist.">
    <following_sub_clause sconj="dass">dass man sich vorstellen kann , wie das Ergebnis ist .</following_sub_clause>
  </case>
  :)