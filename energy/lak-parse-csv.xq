(:http:send-request(
  <http:request method='POST'>
    <http:body media-type='application/x-www-form-urlencoded'/>
  </http:request>,
  'https://www.lak-energiebilanzen.de/wp/wp-admin/admin-post.php',
  'action=dana_post&amp;submit_csv=CSV-Datei+herunterladen&amp;abfrage=e900&amp;var[]=andere_strom&amp;var[]=Stand&amp;land[]=14&amp;land[]=15&amp;Jahre[]=2017&amp;Jahre[]=2018'
)
:)
let $file := file:read-text("/Users/felixfoertsch/Downloads/basex/src/csv-test.csv")

return
csv:parse(
  (: The file has a header, body, and footer each separated by the string `" "`
  The interesting part is the body. It's the second element: `[2]` :)
  tokenize($file, '" "\n')[2],
  map {
    "header": "yes",
    "format": "attributes",
    "separator": "semicolon"
  })