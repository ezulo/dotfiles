setopt prompt_subst

# Build ok / err checkmark
ps1_checkmark() {
    print -r '%(?:%{$fg_bold[green]%}%1{➜%}:%{$fg_bold[red]%}%1{x%})%{$reset_color%}'
}

# Build user@hostname
ps1_userhost() {
    print -r '%{$fg[green]%}%B%n%b%{$reset_color%}@%{$fg[yellow]%}%B%m%b%{$reset_color%}'
}

# Build shrunk working directory
ps1_pwd() {
    print -r '%{$fg[cyan]%}%B$(shrink_path -f)%b%{$reset_color%}'
}

PROMPT="$(ps1_userhost) $(ps1_pwd) $(ps1_checkmark)  "

