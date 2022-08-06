(:
1) Tokenize the text inside the <body> element of the file phi0448.phi001.perseus-lat2.xml: a token is defined as a string separated by one or more whitespace characters (in a regular expression, the relevant argument should be "\s+"). Tokens will be grouped on de basis of their word form, alphabetically ordered, and counted, as shown in result_1.xml 
:)

declare variable $doc := doc("../../db/phi0448.phi001.perseus-lat2.xml");

<text>{
for $b in $doc//*:body//*:p
for $t in tokenize($b, "\s+")
group by $v := $t
order by $v
return
<g count="{count($t)}">{$t}</g>
}</text>