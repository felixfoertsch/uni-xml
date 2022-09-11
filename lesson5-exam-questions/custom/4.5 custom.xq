(: Group all sections by their number and sort them descending :)

declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

<result>{
for $p in $doc//*:body//*:p, $section in $p/..

group by $section-number := number($section/@n)
order by $section-number descending

return
<section n="{$section-number}">
  {$p/..}
</section>
}</result>