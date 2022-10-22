
let $doc := doc('/Users/technician/Documents/courses leipzig/Exam7April2021/treebank_eng.xml')
for $word in $doc//t
where contains ($word/@feats, "Mood=Ind")
and contains ($word/@feats, "Person=3")
return $word/..