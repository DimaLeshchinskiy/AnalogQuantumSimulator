param(
    [string]$OpenScad = "C:\Program Files\OpenSCAD\openscad.com",
    [string]$OutputDirectory = "",
    [int]$Width = 1400,
    [int]$Height = 1000,
    [switch]$Clean
)

$ErrorActionPreference = "Stop"
$ConstructionRoot = Split-Path -Parent $PSScriptRoot
if ([string]::IsNullOrWhiteSpace($OutputDirectory)) {
    $OutputDirectory = Join-Path $ConstructionRoot "assemblies\previews"
}
New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
if ($Clean) {
    Get-ChildItem -LiteralPath $OutputDirectory -File -Filter "*.png" | Remove-Item -Force
}

# Every printable part gets an isolated preview.  The complete workbench is
# rendered separately to make collision checks easy.
$scenes = @(
    @{ Name = "holder-laser"; Source = "print\laser_holder.scad" },
    @{ Name = "holder-pbs"; Source = "print\pbs_holder.scad" },
    @{ Name = "holder-bpw34"; Source = "print\bpw34_holder.scad" },
    @{ Name = "holder-rotation-stator"; Source = "print\rotation_stator.scad" },
    @{ Name = "part-rotation-rotor"; Source = "print\rotation_rotor.scad" },
    @{ Name = "part-filter-cassette"; Source = "print\filter_cassette.scad" },
    @{ Name = "assembly-full"; Source = "assemblies\full.scad" }
)

foreach ($scene in $scenes) {
    $source = Join-Path $ConstructionRoot $scene.Source
    $target = Join-Path $OutputDirectory ($scene.Name + ".png")
    Write-Host "Rendering $($scene.Name)"
    & $OpenScad --imgsize="$Width,$Height" --viewall --autocenter --projection=o -o $target $source
    if ($LASTEXITCODE -ne 0) { throw "OpenSCAD failed: $source" }
}
