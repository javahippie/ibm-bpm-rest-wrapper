. “./Configuration.ps1” 

$context = "/search/query"

function Run-Query {
    Param(
        $columns = "",
        $conditions = "", 
        $sort = "", 
        $secondSort = "", 
        $organization = "byInstance", 
        $size = "100", 
        $performQuery = "true", 
        $filterByCurrentUser = "true"
    )
    $columnParam = "";
    
    foreach($column in $columns) {
        $columnParam = $columnParam + $column;
    }

    $uri = "${endpoint}${context}?columns=${columnParam}?condition=${conditions}&organization=${organization}&run=${performQuery}&shared=false&filterByCurrentUser=${filterByCurrentUser}"
    Write-Host $uri;
    $result = Invoke-WebRequest -Uri $uri -Credential $credential -Method Put -Verbose
}

function Execute-Performance-Query {
    return "Not yet implemented"
}

function Run-Performance-Instance-Query {
    return "Not yet implemented"
}

function Search-Metadata {
    return "Not yet implemented"
}