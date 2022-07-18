(: Question:

Fetch the following file from the web and print it to the output:
https://git.informatik.uni-leipzig.de/celano/sose2022/-/raw/main/texts/mytreebank.xml

fetch:xml()

:)

let $doc := fetch:xml("https://git.informatik.uni-leipzig.de/celano/sose2022/-/raw/main/texts/mytreebank.xml")
return $doc