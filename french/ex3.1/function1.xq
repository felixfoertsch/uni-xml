(: Question:

Write a simple presentation function for bookmarks: it takes a bookmark node as an argument and gives a paragraph corresponding to the title which will be a link (if the title is absent, put the url in place of the title) and a paragraph containing its description (or nothing if there is no description). We will group these two paragraphs in an element div. 
Use the function to generate a web page containing a list of bookmarks that you will test as before. 
Note: The construction can be used if ( test ) then expr1 else expr2to carry out a test. Using ()returns an empty set of elements. 
Recall :In XPath, if a path expression is used instead of a boolean, it evaluates to true iff its result is not empty.

:)

declare function local:print_book($bookmark){
<div>
<p>
<a href="{$bookmark/@url}">{
if ($bookmark/title) then $bookmark/title/text() 
else string($bookmark/@url) 
}</a>
</p> 
<p>{
if ($bookmark/description) then $bookmark/description/text() else ()
}</p>
</div>
};

<html>
<head>
<title> Ma liste de bookmarks </title>
</head>
<body>
<ul>
{
for $bookmark in doc("bookmarks.xml")//bookmark
return
<li>
 {local:print_book($bookmark)}
</li>
}
</ul>
</body>
</html>