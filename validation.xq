declare variable $text := fetch:xml("https://git.informatik.uni-leipzig.de/celano/sose2022/-/raw/main/texts/phi0448.phi001.perseus-lat2.xml");

declare variable $schema := fetch:xml("http://epidoc.stoa.org/schema/8.19/tei-epidoc.rng");

validate:rng-report($text, $schema)
