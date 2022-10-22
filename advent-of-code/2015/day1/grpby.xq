let $brackets :=
<root>
  <close/>
  <open/>
  <open/>
</root>



return
for $bracket in $brackets/*
group by $type := node-name($bracket)


return
<brackets open="{count($bracket)}" close="{}"/>