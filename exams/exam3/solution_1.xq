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
