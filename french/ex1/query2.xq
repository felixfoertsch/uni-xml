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