$url, $out = 'https://www.whoisxmlapi.com/BulkWhoisLookup/bulkServices','json'
$apiKey, $dom = 'Bulk Whois API Key', @('whoisxmlapi.com')

function Api ($U, $Data) {
    $b=@{apiKey=$apiKey;outputFormat=$out}+$Data|ConvertTo-Json
    $r=Invoke-WebRequest -Uri ($url+$U) -Method POST -Body $b|ConvertFrom-Json
    if ($r.messageCode -and $r.messageCode -ne 200){throw "$($r.messageCode)"}
    return $r
}
$id, $c = @{requestId=(Api '/bulkWhois' @{domains=$dom}).requestId},$dom.Count
Do {
    $num=(Api '/getRecords' ($id+@{startIndex=$c+1;maxRecords=0})).recordsLeft
    Start-Sleep -s 5
} Until ($num -eq 0)

echo (Api '/getRecords' ($id + @{startIndex=1; maxRecords=$c})).whoisRecords
