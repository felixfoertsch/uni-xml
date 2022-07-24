(: Question: 

We go back to the previous question, but displaying the categories with their bookmarks using a recursive function. A category will be represented by an element divin which we will put a paragraph giving the name of the category, a paragraph containing its (or its) description(s) and finally an html list which will correspond to all the bookmarks and categories which are children of the category considered. We will use the previous function for formatting bookmarks. Initially, we can possibly put the sub-categories first, followed by the bookmarks. In a second step, we will keep the order given in the Bookmarks document. 
Hint: You can test if an element $node is of foo typeusing the instruction: if ($node instance of element(toto))
You can browse all the child elements of a node referenced by the variable $toto using the XPath expression: $toto/ element()

:)

declare function local:print_book($bookmark){
<div>
  <p>
     <a href="{$bookmark/@url}">
        {
        if ($bookmark/title) then $bookmark/title/text() else string($bookmark/@url) 
        }
     </a>
  </p> 
  <p>
     {
     if ($bookmark/description) then $bookmark/description/text() else ()
     }
  </p>
</div>
};

declare function local:print_cat($categorie){
<div>
<p>
{string($categorie/@nom)}
</p>
<p>
{$categorie/description/text()}
</p>
<ul>
{
for $elt in $categorie/element()
return
 if ($elt instance of element(categorie)) then <li> {local:print_cat($elt)} </li>
  else (if ($elt instance of element(bookmark)) then <li> {local:print_book($elt)} </li> else ())  
}
</ul>
</div>
};

<html>
<head>
<title> Ma liste de bookmarks </title>
</head>
<body>
{
for $categorie in doc("bookmarks.xml")/bookmarks/categorie
return
 local:print_cat($categorie)
}
</body>
</html>