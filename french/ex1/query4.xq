declare function local:books-by-author($root, $last, $first) {
   for $b in $root/book
   where some $ba in $b/author
   satisfies (
    $ba/last = $last and $ba/first=$first
  )
   return $b/title
};

<results>
{
let $doc := doc("../../db/biblio.xml")
let $a := $doc//author
for $last in distinct-values($a/last),
$first in distinct-values($a[last=$last]/first)
order by $last, $first
return
<result>
  <author>
    <last>{$last}</last>
    <first>{$first}</first>
  </author>
  { local:books-by-author($doc/bib, $last, $first) }
</result>
}
</results>