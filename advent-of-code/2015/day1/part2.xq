declare function local:string-to-token($string) {
string-to-codepoints($string)
};

for $t in local:string-to-token(fetch:text("input.txt"))
return
<item value="{$t}"/>