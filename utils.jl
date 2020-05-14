using DelimitedFiles

function hfun_btable(params)
    path = params[1]
    csvcontent,headers   = readdlm(path, ',', String, header=true)
    nrows, ncols = size(csvcontent)
    io = IOBuffer()
    # write headers
    println(io,"<table class=\"table table-striped table-responsive table-sm text-wrap\">")
    println(io,"<caption>","$nrows conferences","</caption>")
    println(io,"<thead class=\"thead-dark\">")
    println(io,"<tr>")
    for i in 1:ncols
        println(io,"<th scope=\"col\" class=\"align-middle\">",headers[i],"</th>")
    end
    println(io,"</tr>")
    println(io,"</thead>")

    # writing content
    println(io,"<tbody>")
    for i in 1:nrows
        println(io, "<tr>")
        for j in 1:ncols-1
            println(io,"<td>",csvcontent[i,j],"</td>")
        end
        println(io,"<td>","<a href=\"",csvcontent[i,ncols],"\">",csvcontent[i,ncols],"</a>","</td>")
        println(io,"</tr>")
    end
    print(io,"</table>")
    return String(take!(io))
end