@def title = "Finance Conference Deadlines"
@def hascode = true


# Finance Conference Deadlines

This is a simple public listing of submission deadlines for academic or research-oriented finance conferences.

The list is in no way comprehensive. The American Finance Association also maintains a [calendar](https://afajof.org/call-for-papers-calendar/).

If you would like a conference added to the list, please open an [issue](https://github.com/tbeason/financeconferences/issues).

I keep a list of past conference deadlines available for download [here](https://raw.githubusercontent.com/tbeason/financeconferences/master/data/conferences_pastdue.csv).



<!-- @@table-striped @@table-hover
\tableinput{}{/data/financeconfdeadlines.csv}
@@  @@ -->

```julia:maketable
#hideall
using DelimitedFiles
path = "data/financeconfdeadlines.csv"
csvcontent,headers   = readdlm(path, ',', String, header=true)
nrows, ncols = size(csvcontent)
io = IOBuffer()
# print(io,"@@div ")
# write headers
println(io,"<table class=\"table table-striped table-hover table-responsive\">")
println(io,"<caption>","$nrows conferences","</caption>")
println(io,"<thead class=\"thead-dark\">")
println(io, "<tr>")
for i in 1:ncols
    println(io,"<th scope=\"col\">",headers[i],"</th>")
end
println(io,"</tr>")
println(io,"</thead>")

# writing content
write(io,"<tbody>","\n")
for i in 1:nrows
    println(io, "<tr>")
    for j in 1:ncols-1
        println(io,"<td>",csvcontent[i,j],"</td>")
    end
    println(io,"<td>",csvcontent[i,ncols],"</td>")
    println(io,"</tr>")
end
println(io,"</table>")
# println(io,"@@")
String(take!(io)) |> println
```

\output{maketable}


~~~
<p></p>
<button type="button" class="btn btn-primary"> <a href="https://raw.githubusercontent.com/tbeason/financeconferences/master/data/financeconfdeadlines.csv">Download as CSV</a></button>
~~~


