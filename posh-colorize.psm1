Get-Command pygmentize 2>&1> $null;
Set-Variable -Name PoshColorizeHasPygmentize -Value $? -Scope "Global"

function Test-Pygment() {
    $hasPygment = Get-Variable -Name PoshColorizeHasPygmentize -Scope "Global"
    if (-not $hasPygment.Value) {
        Throw "The command pygmentize could not be found. Please ensure it is available and reload powershell."
    }
}

function Get-LexxerFromFileName([System.IO.FileInfo]$file) {
    $result = switch ( $file.Name )
    {
        "*.jsx" { "js" }
        "*.tsx" { "ts" }
        ".*rc" { "ini" }
        default { $extension }
    }

    return $result
}

function Get-Less([System.IO.FileInfo]$file) {
    Get-Content -Path $file | Out-Host -paging
}
Set-Alias -Name less -Value Get-Less

function Get-ColorizedContent([System.IO.FileInfo]$file, [switch]$tail) {
    Test-Pygment
    $lexer = Get-LexxerFromFileName $file
    Get-Content -Path $file -Wait:$tail | pygmentize -f terminal16m -O style=gruvbox-dark -s -l $lexer
}
function Get-ColorizedLess([System.IO.FileInfo]$file) {
    Test-Pygment
    Get-ColorizedContent $file | Out-Host -paging
}
Set-Alias -Name ccat -Value Get-ColorizedContent
Set-Alias -Name cless -Value Get-ColorizedLess