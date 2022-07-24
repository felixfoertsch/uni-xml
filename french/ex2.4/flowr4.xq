(: Question:

For each file, create an a element containing an href attribute indicating the url of the document and having as child the text indicating the name of the document. We can use the string(.) function to retrieve the value of an attribute in text form.

:)

for $file in doc("database.xml")//file
return 
  <a href="{$file/@url}">{string($file/@name)}</a>