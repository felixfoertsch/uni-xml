(: Qeustion:

For each volume of the collection give its number, the name of its series and its title in the form of attributes. Order by title.

:)

for $tome in doc("collection.xml")//tome
let $serie := doc("collection.xml")//serie[tome=$tome]
let $titre := $tome/titre/text()
order by $titre
return 
  <tome numero="{$tome/@numero}" serie="{$serie/@nom}" titre="{$titre}"/>