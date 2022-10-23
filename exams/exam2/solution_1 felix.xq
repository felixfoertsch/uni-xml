(:
Tokenize the text inside the <body> element of the file phi0448.phi001.perseus-lat2.xml: a token is defined as a string separated by one or more whitespace characters (in a regular expression, the relevant argument should be "\s+"). Tokens will be grouped on de basis of their word form, alphabetically ordered, and counted, as shown in result_1.xml
:)
declare option output:indent 'yes';
declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

element text {
  for $p in $doc//*:body//*:p, $t in data(tokenize($p, "\s+"))

  group by $group := $t
  order by $group

  return
  element g {
    attribute count { count($t) },
    $t
  }
}

(:
<text>
  <g count="3">" " "</g>
  <g count="1">"Frustra,"</g>
  <g count="1">"Habetis,"</g>
  <g count="1">"Haec</g>
  <g count="1">"Haec,"</g>
  ...
:)