<results>
{
  let $a := doc("../../db/biblio.xml")//author
  for $last in distinct-values($a/last), $first in distinct-values($a[last=$last]/first)
  order by $last, $first
  return
  <result>
    <author>
      <last>{$last}</last>
      <first>{$first}</first>
    </author>
    {
      for $b in doc("biblio.xml")/bib/book
      where some $ba in $b/author
      satisfies ($ba/last = $last and $ba/first=$first)
      return $b/title 
    }
  </result>
}
</results>