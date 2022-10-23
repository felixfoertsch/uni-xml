(:
Find all sections in file phi0448.phi001.perseus-lat2.xml which contain the strings: " est ", " est,", " est:", " est." and return them specifying their book, chapter, and section references (plus the number of the returned result), as you can see in result_1.xml.
:)
declare option output:indent 'yes';
declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

<text>{
for $b in $doc//*:body//*:p
let $l := $b[matches($b, " est ")
             or matches($b, " est,") or matches($b, " est:") or contains($b, " est.")]
where $l
count $count
return
<p n="{$count}"
   book="{$b/ancestor::*:div[@subtype='book']/@n}"
   chapter="{$b/ancestor::*:div[@subtype='chapter']/@n}"
   section="{$b/ancestor::*:div[@subtype='section']/@n}">{$l/text()}</p>
}</text>
