<data>
{
  for $year in distinct-values(doc("biblio.xml")//book/@year)
  let $avg := avg(doc("biblio.xml")//book[@year=$year]/price/text())
  return <year value="{$year}" avgprice="{$avg}"/>
}
</data>