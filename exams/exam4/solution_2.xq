(:
2) Find all paragraphs in phi0448.phi001.perseus-lat2.xml (i.e., element <p/>) 
which contains the string "Helveti" and return the results in descending order 
as far as the book number is concerned, as shown in result_2.xml (note that 
the descending order only concerns the book numbers, not
the chapter or section numbers).
:)

declare option output:indent 'yes';

declare variable $doc := doc("./phi0448.phi001.perseus-lat2.xml");

<result>{
for $s in $doc//*:div[@subtype="section"]/*:p
where contains($s,"Helveti")
let $a := $s/ancestor::*:div[@subtype="book"]
order by xs:integer($a/@n) descending
return
<instance book="{$s//ancestor::*:div[@subtype='book']/@n}"
        chapter="{$s//ancestor::*:div[@subtype='chapter']/@n}"
        section="{$s//ancestor::*:div[@subtype='section']/@n}">
{data($s)}
</instance>
}</result>