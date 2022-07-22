# XML

## Axes

- **ancestor**: Indicates all the ancestors of the context node beginning with the parent node and traveling through to the root node.
- **ancestor-or-self**: Indicates the context node and all of its ancestors, including the root node.
- **attribute**: Indicates the attributes of the context node. Only elements have attributes. This axis can be abbreviated with the at sign (@).
- **child**: Indicates the children of the context node. If an XPath expression does not specify an axis, this is understood by default. Since only the root node or element nodes have children, any other use will select nothing.
- **descendant**: Indicates all of the children of the context node, and all of their children, and so forth. Attribute and namespace nodes are not included - the parent of an attribute node is an element node, but attribute nodes are not the children of their parents.
- **descendant-or-self**: Indicates the context node and all of its descendants. Attribute and namespace nodes are not included - the parent of an attribute node is an element node, but attribute nodes are not the children of their parents.
- **following**: Indicates all the nodes that appear after the context node, except any descendant, attribute, and namespace nodes.
- **following-sibling**: Indicates all the nodes that have the same parent as the context node and appear after the context node in the source document.
- **parent**: Indicates the single node that is the parent of the context node. It can be abbreviated as two periods (..).
- **preceding**: Indicates all the nodes that precede the context node in the document except any ancestor, attribute and namespace nodes.
- **preceding-sibling**: Indicates all the nodes that have the same parent as the context node and appear before the context node in the source document.
- **self**: Indicates the context node itself. It can be abbreviated as a single period (.).

## Functions

### analyze-string()

### contains()

`fn:contains($arg1 as xs:string?, $arg2 as xs:string?) as xs:boolean`

### filter()

`fn:filter($seq as item()*, $f as function(item()) as xs:boolean) as item()*`

### matches()

`fn:matches($input as xs:string?, $pattern as xs:string) as xs:boolean`

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
- sequence
- `if (condition) then <code> else <code>`
