(: Question:

Fetch the following file from the internet and write it to disk:
https://git.informatik.uni-leipzig.de/celano/sose2022/-/raw/main/texts/mytreebank.xml

file:write()

:)

let $doc := fetch:xml("https://git.informatik.uni-leipzig.de/celano/sose2022/-/raw/main/texts/mytreebank.xml")

return file:write("/Users/felixfoertsch/Developer/Uni-Development/uni-xml/db/converted-conllu.xml", $doc)