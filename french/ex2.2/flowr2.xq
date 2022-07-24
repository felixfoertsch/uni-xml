(: Qeustion:

For each volume of the collection give its number, the name of its series and its title in the form of attributes.

:)

for $tome in doc("collection.xml")//tome
let $serie := doc("collection.xml")//serie[tome=$tome]
return 
  <tome numero="{$tome/@numero}" serie="{$serie/@nom}" titre="{$tome/titre/text()}"/>