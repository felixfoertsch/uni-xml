(:
Find all instances of the word "propter" contained in Book 7 in phi0448.phi001.perseus-lat2.xml, and return the word following it, as shown in result_1.xml ("word" is defined as a string of characters separated by whitespace characters, which in XQuery regular expressions can be specified as "\s+").
:)
declare option output:indent 'yes';
declare variable $doc := doc("./phi0448.phi001.perseus-lat2.xml");

<result>
{
for $p in $doc//*:div[@subtype="book"][@n="7"]//*:p
for $g in analyze-string($p, "\s+")
where $g//*:non-match = "propter"
return
<instance
           book="{$p//ancestor::*:div[@subtype='book']/@n}"
           chapter="{$p//ancestor::*:div[@subtype='chapter']/@n}"
           section="{$p//ancestor::*:div[@subtype='section']/@n}">
{$g//*:non-match[. = "propter"]/following-sibling::*[2]/text()}
</instance>
}
</result>