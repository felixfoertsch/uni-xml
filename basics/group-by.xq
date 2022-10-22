let $books :=
<books>
  <book>
    <author>Peter Zwegat</author>
    <title>Rechnen ist cool</title>
  </book>
  <book>
    <author>Peter Zwegat</author>
    <title>Rechnen -- ganz ohne Mathe</title>
  </book>
  <book>
    <author>Stephen King</author>
    <title>Der Bus des Grauens</title>
  </book>
</books>

return
for $book in $books/book
group by $author := $book/author

return
<author name="{$author}">
  {
    for $book in $book
    
    return
    <book title="{$book/title}"/>
  }
</author>

(: order by mit zwei Parametern:)
for $book in $list/book 
order by $book/@date descending, $book/text()
group by $date := $book/@date
return <list published="{ $date }"> { $book