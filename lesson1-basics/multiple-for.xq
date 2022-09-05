Multiple for clauses You can use multiple for clauses in a FLWOR, which is similar to nested loops in a programming language. The result is that the rest of the FLWOR is evaluated for every combination of the values of the variables. Example 6-3 shows a query with two for clauses, and demonstrates the order of the results.

Example 6-3. Multiple for clauses Query

for $i in (1, 2)
for $j in ("a", "b")
return
<oneEval>i is {$i} and j is {$j}</oneEval>

Results
<oneEval>i is 1 and j is a</oneEval>
<oneEval>i is 1 and j is b</oneEval>
<oneEval>i is 2 and j is a</oneEval>
<oneEval>i is 2 and j is b</oneEval>

The order is significant; it uses the first value of the first variable ($i) and iterates over the values of the second variable ($j), then takes the second value of $i and iterates over the values of $j.

Also, multiple variables can be bound in a single for clause, separated by commas. This has the same effect as using multiple for clauses. The example shown in Example 6-4 returns the same results as Example 6-3. This syntax is shorter but can be less clear in the case of complex expressions.

Example 6-4. Multiple variable bindings in one for clause

for $i in (1, 2), $j in ("a", "b")

return
<oneEval>i is {$i} and j is {$j}</oneEval>