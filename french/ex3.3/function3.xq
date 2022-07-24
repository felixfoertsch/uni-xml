(: Question:

In this document, each part has an identifier id, a name and optionally the identifier of a part of which it constitutes a part. Write a recursive function that returns a hierarchy of parts representing the composition of a part. Be careful, you cannot use an XPath path starting with / in a function. Use this function to hierarchically represent the parts.xml document .

:)

declare function local:descendants($piece_father)
{
<piece nom="{$piece_father/@nom}" id="{$piece_father/@id}">
       {
       for $piece in doc("pieces.xml")//piece
       where $piece/@used-in = $piece_father/@id
       return local:descendants($piece)
       }
</piece>
};

<hierarchy>
{
for $piece in doc("pieces.xml")//piece
return
 if ($piece/@used-in) then () else local:descendants($piece)
}
</hierarchy>
