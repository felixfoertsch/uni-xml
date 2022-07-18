# Exercise 1

## Query 1

```XQuery
<bib>
  {
    for $b in doc("../../db/biblio.xml")//book
    where $b/publisher = "Addison-Wesley" and $b/@year > 1991
    return
    <book year="{$b/@year}">
      {$b/title}
    </book>
  }
</bib>
```

Selects books published by Addison-Wisley after 1991. For each of them, returns a book element containing the title of the book and having a year attribute containing the year of publication. Note the use of where to add a constraint on the items selected by the for loop.

All of these book elements are placed in a bib element.

## Query 2

```XQuery
<results>
  {
    for $b in doc("../../db/biblio.xml")//book, $t in $b/title, $a in $b/author
    return
    <result>
      {$t}
      {$a}
    </result>
  }
</results>
```

Built from the bibliographic data a list of elements result containing book title - author associations (join). These elements are placed within a results tag. Be careful, chaining variables with commas in a for actually matches multiple nested for loops.

## Query 3

```XQuery
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
```

Constructs for each author the list of books of which he is one of the authors. For each author, this information is placed in a result tag. All of these tags are placed in an element results. A double loop is necessary to 1/ browse the list authors and 2/ for each author, browse the list of books to list the books of which he is the author.

## Query 4

```XQuery
declare function local:books-by-author($root, $last, $first) {
  for $b in $root/book
  where some $ba in $b/author
  satisfies ($ba/last = $last and $ba/first=$first)
  return
  $b/title
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
```

Constructs the same result as the previous query. The difference lies in the fact that a function has been isolated to execute what was in the previous query the inner loop: given a author, recover all the books of which he is the author.

## Query 5

```XQuery
<bib>
  {
  for $b in doc("biblio.xml")//book
  where count($b/author) > 0
  return
  <book>
    { $b/title }
    { for $a in $b/author[position() <= 2] return $a }
    { if (count($b/author) > 2) then <et-al/> else () }
  </book>
  }
</bib>
```

For each book in the bibliography with at least one author, constructs a book element containing the title of the book and, if there is less than two authors, the list of authors, otherwise only the two first authors and an empty element et-al. The whole is included in a bib element.

## Request 6

```XQuery
declare function local:books-by-author($root, $last, $first) {
  for $b in $root/book
  where some $ba in $b/author
  satisfies ($ba/last = $last and $ba/first=$first)
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
  <number>
   { count(local:books-by-author(doc("biblio.xml")/bib,$last, $first)) }
  </number>
  </result>
}
</results>
```

Like query 4 returning for each author, instead of the list of books he has written, the number of books he has written.

## Query 7

```XQuery
<data>
{
  for $year in distinct-values(doc("biblio.xml")//book/@year)
  let $avg := avg(doc("biblio.xml")//book[@year=$year]/price/text())
  return <year value="{$year}" avgprice="{$avg}"/>
}
</data>
```

Constructed for each year for which at least one book has been published a year element that has a value attribute with the value of the year concerned and an attribute avgprice containing the average price of books published this year.The whole is placed in a data tag.
