param(
    [string]$OpenScad = "C:\Program Files\OpenSCAD\openscad.com",
    [string]$OutputDirectory = "",
    [switch]$Clean
)

$ErrorActionPreference = "Stop"
$ConstructionRoot = Split-Path -Parent $PSScriptRoot
if ([string]::IsNullOrWhiteSpace($OutputDirectory)) {
    $OutputDirectory = Join-Path $ConstructionRoot "stl"
}
New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
if ($Clean) {
    Get-ChildItem -LiteralPath $OutputDirectory -File -Filter "*.stl" | Remove-Item -Force
}

$parts = @("laser_holder", "pbs_holder", "rotation_stator", "rotation_rotor", "filter_cassette", "bpw34_holder", "paper_holder")
foreach ($part in $parts) {
    $source = Join-Path $ConstructionRoot ("print\" + $part + ".scad")
    $target = Join-Path $OutputDirectory ($part + ".stl")
    Write-Host "Building $part"
    & $OpenScad -o $target $source
    if ($LASTEXITCODE -ne 0) { throw "OpenSCAD failed: $source" }
}
