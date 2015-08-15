param($file="README")
function start-jobhere([scriptblock]$block) {
    Start-Job -Init ([ScriptBlock]::Create("Set-Location $pwd")) -Script $block
}

start-jobhere {browser-sync start --files="$1.html" --browser chrome --server }
gulp watch --file $1

