(: Question:

Transform the previous query to obtain an html list containing the links to the files. 
Reminder: an html list is made up of an element olor ulcontaining a set of elements liwhose content corresponds to the different elements of the list.

:)

<ol>
{
for $file in doc("database.xml")//file
return 
  <li>
  <a href="{$file/@url}">{string($file/@name)}</a>
  </li>
}
</ol>