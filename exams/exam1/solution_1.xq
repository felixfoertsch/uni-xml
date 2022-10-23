(:
Tokenize the text inside the <body> element of the file: a token is defined as a string
separated by one ore more whitespace characters (in a regular expression, the relevant argument should be "\s+").
Each token will also be specified for its Book, Chapter and Section, as you can see in result_1.xml.
:)
declare option output:indent 'yes';
declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

<text>
{
  for $book in $doc//*:body//*:div[@subtype="book"],
    $chapter in $book/*:div[@subtype="chapter"],
    $section in $chapter/*:div[@subtype="section"],
    $t in tokenize($section, "\s+")

  return
  <t book="{$book/@n}" chapter="{$chapter/@n}" section="{$section/@n}">{$t}</t>
}
</text>


(:
<text>
  <t book="1" chapter="1" section="1">Gallia</t>
  ...
</text>
:)