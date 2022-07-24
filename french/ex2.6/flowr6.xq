(: Question:

Transform the previous query again so that:

The urls of the links are absolute (ie start with http://www.lif.univ-mrs.fr/~preynier/XML/tp6/). We can use the function concat(.,.).
The result forms an HTML document. You can use the model below:
<html>
  <head>
    <title>Document title</title>
  </head>
  <body>
    Document content
  </body>
</html>

Copy paste the result in a notepad and save it with the .html extension . Open the file with a browser and check that the links work (if the browser is struggling, try without the first line of the result).

:)

<html>
<head>
<title> Liste de documents</title>
</head>
<body>
<ol>
{
for $file in doc("database.xml")//file
return 
  <li>
  <a href="{concat("http://www.lif.univ-mrs.fr/~preynier/XML/files/",string($file/@url))}">{string($file/@name)}</a>
  </li>
}
</ol>
</body>
</html>