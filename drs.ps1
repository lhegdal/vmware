foreach ($Cluster in Get-Cluster) {
    Write-Host "`n"
    Write-Host $Cluster.Name
    $ClusterVMs = ($Cluster | Get-VM)
    $GroupVMs = $null
    foreach ($DrsGroup in ($Cluster | Get-DrsClusterGroup)) {
        $GroupVMs = $GroupVMs + $DrsGroup.Member
    }
    foreach ($VM in $ClusterVMs) {
        if ($VM -notin $GroupVMs) {Write-Host "`t" $VM.name}
    }
}