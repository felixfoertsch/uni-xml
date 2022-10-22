# XML

## Axes

- **ancestor**
- **ancestor-or-self**
- **attribute**: Indicates the attributes of the context node. Only elements have attributes. This axis can be abbreviated with the at sign (@).
- **child**
- **descendant**
- **descendant-or-self**
- **following**: Indicates all the nodes that appear after the context node, except any descendant, attribute, and namespace nodes.
- **following-sibling**: Indicates all the nodes that have the same parent as the context node and appear after the context node in the source document.
- **parent**: Indicates the single node that is the parent of the context node. It can be abbreviated as two periods (..).
- **preceding**: Indicates all the nodes that precede the context node in the document except any ancestor, attribute and namespace nodes.
- **preceding-sibling**: Indicates all the nodes that have the same parent as the context node and appear before the context node in the source document.
- **self**

## Snippets

### FLOWR -> **at**

```XQuery
for $prod at $count in doc("catalog.xml")//product[@dept = ("ACC", "WMN")]
return
<p>{$count}. {data($prod/name)}</p>
```

### FLOWR -> **at** und WHERE (position in a sorted list)

```XQuery
let $sortedProds := for $prod in doc("catalog.xml")//product
                    where $prod/@dept = "ACC" or $prod/@dept = "MEN"
                    order by $prod/name
                    return $prod
for $sortedProd at $count in $sortedProds
return <p>{$count}. {data($sortedProd/name)}</p>
```

### Update Facility

```XQuery
copy $copy := doc("phi0448.phi001.perseus-lat2.xml")
modify
(
  for $p in  $copy//*:body//*:p
  return
  replace node $p with upper-case($p)

 (:
  replace node $item with upper-case($item)
  replace value of node $item with "Hallo"
  rename node as "Hallo"
  insert node (<f name="cookie">Hallo</f>) into $item
  insert node (element f { attribute name {"cookie"}, text {"Hallo"}}) into $item
  delete node
  :)
)
return
$copy
```

### Grouping

```XQuery
(: Group all sections by their number and sort them descending :)

declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

<result>
  {
    for $p in $doc//*:body//*:p, $section in $p/..

    group by $section-number := number($section/@n)
    order by $section-number descending

    return
    <section n="{$section-number}">
      {$p/..}
    </section>
  }
</result>
```

### Odd and even

```XQuery
(: Transform the text of all odd sections to upper-case and all even sections to lower-case :)

declare variable $doc := doc("phi0448.phi001.perseus-lat2.xml");

copy $copy := $doc
modify (
  for $p in $copy//*:body//*:p
  let $section-number := $p/../@n

  return
  replace node $p with
  if ($p[$section-number mod 2 = 0]) then
    lower-case($p)
  else
    upper-case($p)
)
return $copy
```

```XQuery
```

```XQuery
```

## Functions

### analyze-string()

```XML
...
<analyze-string-result xmlns="http://www.w3.org/2005/xpath-functions">
  <non-match>sperabant,</non-match>
</analyze-string-result>

<analyze-string-result xmlns="http://www.w3.org/2005/xpath-functions">
  <match>propter</match>
  <non-match>ea</non-match>
</analyze-string-result>

<analyze-string-result xmlns="http://www.w3.org/2005/xpath-functions">
  <non-match>quod</non-match>
</analyze-string-result>
...
```

### matches() vs contains()

`fn:matches($input as xs:string?, $pattern as xs:string) as xs:boolean`

`fn:contains($arg1 as xs:string?, $arg2 as xs:string?) as xs:boolean`

### filter()

`fn:filter($seq as item()*, $f as function(item()) as xs:boolean) as item()*`

### replace()

`fn:replace($input as xs:string?, $pattern as xs:string, $replacement as xs:string) as xs:string`

### starts-with()

### ends-with()

## Functions for Sequences

fn:zero-or-one($seq)
fn:one-or-more($seq)
fn:exactly-one($seq)
fn:empty($seq)
fn:exists($seq)
fn:count($seq)
fn:insert-before()
fn:remove
fn:reverse
fn:unordered

## Syntax

- `declare function function-name($arg, ...) {}`
- `\s` space character
- `if (condition) then <code> else <code>`
- Comparators: `/book[date/@year gt "2012"]`
  - eq (equal)
  - ne (not equal)
  - lt (less than)
  - le (less than or equal)
  - gt (greater than)
  - ge (greater than or equal)

# UD Questions

Source: <https://universaldependencies.org/u/overview/syntax.html>

## Explain the UD annotation principle of "primacy of content words" and specify why it was adopted

- Content words: In UD there are content words and function words
- The priumacy of content words means, that we usually attach function words to content words and not vice versa
- It was adopted because it allows to compare diferent languages better. E.g. some languages have cases, some don't and marking them up with the primacy of content words, shows this difference clearly. Latin: liber-Marci vs. Englisch: book-of-Marc

## How is coordination annotated in UD? Answer by giving an example and specify why this annotation strategy is questionable on linguistic grounds

- "Coorindation" refers to the function words "and", "or" that combine sentences (see [here](https://universaldependencies.org/u/overview/syntax.html#coordination))
- Questionable because a syntactic tree implies that there is always suboordination (there is always a root/head), even though there is not necesarrily a suboordination relation: "she drove to and from work" she<-drove->work->to->from->and

# Aufbau einer TEI-Datei

Beispieldatei: phi0448.phi001.perseus-lat2.xml

```XML
- <TEI/>
  - <teiHeader/>
    - <fileDesc/>
    - <encodingDesc/>
    - <profileDesc/>
    - <revisionDecs/>
  - <text/>
    - <body/>
      - <div n="urn:cts:latinLit:phi0448.phi001.perseus-lat2" type="edition"/>
        - <div n="[1-8]" type="textpart" subtype="book"/>
          - <head/>
          - <div n="1" type="textpart" subtype="chapter" />
            - <div n="1" type="textpart" subtype="section" >
              - <p/>
            - <div n="2" type="textpart" subtype="section" >
            - <div n="..." type="textpart" subtype="section" >
          - <div n="2" type="textpart" subtype="chapter" />
            - <div n="1" type="textpart" subtype="section" >
            - <div n="2" type="textpart" subtype="section" >
            - <div n="..." type="textpart" subtype="section" >
```

# Questions

Source: <https://universaldependencies.org/u/overview/syntax.html>

## Explain the UD annotation principle of "primacy of content words" and specify why it was adopted

- Content words: In UD there are content words and function words
- The priumacy of content words means, that we usually attach function words to content words and not vice versa
- It was adopted because it allows to compare diferent languages better. E.g. some languages have cases, some don't and marking them up with the primacy of content words, shows this difference clearly. Latin: liber-Marci vs. Englisch: book-of-Marc

## How is coordination annotated in UD? Answer by giving an example and specify why this annotation strategy is questionable on linguistic grounds

- "Coorindation" refers to the function words "and", "or" that combine sentences (see [here](https://universaldependencies.org/u/overview/syntax.html#coordination))
- Questionable because a syntactic tree implies that there is always suboordination (there is always a root/head), even though there is not necesarrily a suboordination relation: "she drove to and from work" she<-drove->work->to->from->and
