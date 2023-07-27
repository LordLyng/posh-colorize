# posh-colorize
A powershell module for colorzing Get-Content ouput

## Prerequisistes
This module relies on the [Pygments package](https://pygments.org/ "Pygments syntax highlighter").

### Installing the prerequisites on windows
1. Install python if not already installed on your system
2. Run `py -m "pip" install Pygments` - After doing this i was warned that my python scripts were not in my PATH, this is needed for this module to work so i added them to my PATH.
3. Verify by running `pygmentize -V` to see that pygmentize is available

## Module installation
I do not plan on maintaining this so it won't be published to the powershell gallery.

I do hoever reocmmend the existing module called `Install-ModuleFromGitHub` an article can be found on how it works [here](https://dfinke.github.io/powershell/2016/11/21/Quickly-Install-PowerShell-Modules-from-GitHub.html).

After installing it, it hsould be as simple as running:
`Install-ModuleFromGitHub -GitHubRepo LordLyng/posh-colorize -Bracnh main -Scope CurrentUser`

## Usage
it essentially registers 3 methods and 3 aliases. I mostly use the aliases, they will be lsited here with a short explannation.

**less**  
Like cat but meant for alrge files paging the output.

**ccat**  
Does the same as `cat` or `Get-Cotnent` but colorizes the output. The lexxer used is selected based ont he filename.

**cless**  
Like less, but with colros.

## TODO
!. Make the pygments theme changeable