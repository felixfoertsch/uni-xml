(:
Find all sections in file phi0448.phi001.perseus-lat2.xml which contain the strings:
" est ", " est,", " est:", " est." and return them specifying their book, chapter, and section references (plus the number of the returned result), as you can see in result_1.xml.

:)
declare option output:indent 'yes';
declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

element text {
  for $p in $doc//*:body//*:p

  (: It's necessary to escape the dot in the last expression; else it also matches semicolons `;` :)
  where matches($p, " est | est,| est:| est\.")
  count $c

  return
  element p {
    attribute n { $c },
    attribute book { $p/../../../@n },
    attribute chapter { $p/../../@n },
    attribute section { $p/../@n },
    $p/text()
  }
}

(:
<text>
  <p n="1" book="1" chapter="1" section="1">Gallia est omnis divisa in partes tres, quarum unam incolunt Belgae, aliam Aquitani, tertiam qui ipsorum lingua Celtae, nostra Galli appellantur.</p>
  <p n="2" book="1" chapter="1" section="5">[Eorum una pars, quam Gallos obtinere dictum est, initium capit a flumine Rhodano, continetur Garumna flumine, Oceano, finibus Belgarum, attingit etiam ab Sequanis et Helvetiis flumen Rhenum, vergit ad septentriones.</p>
  ...
:)