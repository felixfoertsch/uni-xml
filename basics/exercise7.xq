copy $c := fetch:xml("https://git.informatik.uni-leipzig.de/celano/sose2022/-/raw/main/texts/mytreebank.xml")
modify
(
for $r in $c//token
let $f := $r/@form = "not"
let $u := $r/GUPOS = "PART"
where $f and $u
return

replace value of node $r/@UPOS with 'ADV'
)

return
$c