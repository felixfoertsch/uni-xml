(:
1) Find all instances of the word "propter" contained in Book 7 in phi0448.phi001.perseus-lat2.xml, and return the word following it, as shown in result_1.xml ("word" is defined as a string of characters separated by whitespace characters, which in XQuery regular expressions can be specified as "\s+").
:)

declare option output:indent 'yes';

declare variable $doc := doc("./phi0448.phi001.perseus-lat2.xml");

element result {
let $book7 := $doc//*:div[@subtype="book"][@n=7]
let $paras-in-book-7 := $book7//*:p

for $para in $paras-in-book-7
for $item in tokenize(analyze-string($para/text(), "\spropter\s")//*:match/following-sibling::*/text())[1]
return

element instance {
  attribute book {
    $para/../../../@n/data()
  },
  attribute chapter {
    $para/../../@n/data()
  },
  attribute section {
    $para/../@n/data()
  },
  text {
    $item
  }
}
}

(:
<result>
  <instance book="7" chapter="20" section="5">animi</instance>
  <instance book="7" chapter="41" section="2">magnitudinem</instance>
  <instance book="7" chapter="43" section="4">inscientiam</instance>
  <instance book="7" chapter="52" section="2">iniquitatem</instance>
  <instance book="7" chapter="57" section="3">singularem</instance>
  <instance book="7" chapter="77" section="2">eius</instance>
  <instance book="7" chapter="83" section="2">magnitudinem</instance>
  <instance book="7" chapter="86" section="4">magnitudinem</instance>
</result>
:)