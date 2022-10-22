(: at $n ist die Position im Loop... :)
for $book at $n in $list/book
return fn:concat($n, ". ", $book/text())

for $book in $list/book
order by $book/text()
count $n 
return fn:concat($n, ". ", $book/text())