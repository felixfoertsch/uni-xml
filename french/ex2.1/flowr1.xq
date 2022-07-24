(: Question:

For each series, create a series element with a title attribute containing the name of the series and a publisher attribute containing the name of its publisher (the value of the publisher attribute is "" if there is no publisher for the series).

:)

for $serie in doc("collection.xml")//serie
return 
       <serie 
       titre="{$serie/@nom}"
       editeur="{$serie/editeur/@nom}"
       />