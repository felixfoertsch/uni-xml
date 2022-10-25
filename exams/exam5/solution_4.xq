(:
4)
The files tlg0006.tlg003.perseus-grc2.tok01_postag01.xml and tlg0006.tlg003.perseus-grc2.tok01_lemma01.xml contain the same number of <feat> elements, where each of it contains a piece of annotation related to a word form specified in the XML comment following each <feat> element. For example, the first <feat> element + XML comment in tlg0006.tlg003.perseus-grc2.tok01_postag01.xml is

<feat xlink:href="#tok_1" value="n-s---md-"/>
<!--Εἴθ-->

The annotation is in @value and refers to the token '#tok_1', whose word form  is specified in the immediately following XML comment <!--Εἴθ-->. If you open the other file tlg0006.tlg003.perseus-grc2.tok01_lemma01.xml, you will find the same structure:

<feat xlink:href="#tok_1" value="εἴθς"/>
<!--Εἴθ-->

The annotation is again in @value ("εἴθς") and again refers to "#tok_1", whose word form is "Εἴθ" (if values in @xlink:href are the same, then the XML comments are also always the same). Connect the two file so as to get the result in result_4.xml

Tip: XML comments are nodes that can be accessed using the syntax: comment(). To extract the content of a comment node use the function data().
:)

declare option output:indent 'yes';
declare variable $doc1 := doc("tlg0006.tlg003.perseus-grc2.tok01_postag01.xml");
declare variable $doc2 := doc("tlg0006.tlg003.perseus-grc2.tok01_lemma01.xml");

element file {
  let $p1 := for $one in $doc1//feat
    let $comment1 := $one/following::comment()[1]
    return
    element token {
      attribute id { $one/@*:href },
      attribute word_form { $comment1 },
      attribute postag { $one/@*:value }
  
    }
    
  let $p2 := for $two in $doc2//feat
    let $comment1 := $two/following::comment()[1]
    return
    element token {
      attribute id { $two/@*:href },
      attribute lemma { $two/@*:value }
    }
   
  return
  for $feat1 in $p1
  
  let $match := $p2[@id = $feat1/@id]
  
  
  return
    element token {
      attribute id { $feat1/@id },
      attribute word_form { $feat1/@word_form },
      attribute postag { $feat1/@postag },
      attribute lemma { $match/@lemma }
    } 
} 


(:
<file>
  <token id="#tok_1" word_form="Εἴθ" postag="n-s---md-" lemma="εἴθς"/>
  <token id="#tok_2" word_form="’" postag="u--------" lemma="ὦ"/>
  <token id="#tok_3" word_form="ὤφελ" postag="v2saia---" lemma="ὀφέλ"/>
:)