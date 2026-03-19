# Termux Pro Theme - Aliases & Functions
# Append this to .zshrc

#------------------------- System Aliases -------------------------#
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -a'
alias cls='clear'
alias h='history | tail -20'
alias hg='history | grep'
alias path='echo $PATH | tr ":" "\n"'
alias ports='netstat -tulanp'
alias ip='curl -s ifconfig.me'
alias weather='curl -s wttr.in/Dhaka'
alias speed='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python'

#------------------------- Package Manager ------------------------#
alias update='pkg update && pkg upgrade -y'
alias install='pkg install'
alias remove='pkg uninstall'
alias search='pkg search'
alias list='pkg list-installed'

#------------------------- File Operations ------------------------#
alias mkdir='mkdir -p'
alias rmdir='rmdir'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias df='df -h'
alias du='du -h'
alias free='free -h'

#------------------------- Custom Functions -----------------------#

# Help menu
help() {
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║              Termux Pro Theme Commands              ║"
    echo "╠══════════════════════════════════════════════════════╣"
    echo "║ System:                                              ║"
    echo "║   ip          - Show public IP                       ║"
    echo "║   weather     - Show weather                         ║"
    echo "║   speed       - Test internet speed                  ║"
    echo "║   ports       - Show open ports                      ║"
    echo "║                                                      ║"
    echo "║ Files:                                                ║"
    echo "║   ll, la      - List files                           ║"
    echo "║   .., ...     - Navigate directories                 ║"
    echo "║                                                      ║"
    echo "║ Packages:                                             ║"
    echo "║   update      - Update all packages                  ║"
    echo "║   install     - Install package                      ║"
    echo "║                                                      ║"
    echo "║ Notes:                                                ║"
    echo "║   note new     - Create new note                     ║"
    echo "║   note list    - List all notes                      ║"
    echo "║   note show    - View note                           ║"
    echo "╚══════════════════════════════════════════════════════╝"
}

# Note taking function
note() {
    NOTES_DIR="$HOME/notes"
    mkdir -p "$NOTES_DIR"
    
    case $1 in
        new)
            nano "$NOTES_DIR/$2.txt"
            ;;
        list)
            ls -la "$NOTES_DIR/"
            ;;
        show)
            cat "$NOTES_DIR/$2.txt"
            ;;
        *)
            echo "Usage: note [new|list|show] [name]"
            ;;
    esac
}

# Quick calculator
calc() {
    echo "scale=2; $*" | bc -l
}

# Create backup
backup() {
    tar -czf "termux-backup-$(date +%Y%m%d).tar.gz" ~/.zshrc ~/.termux
    echo "Backup created: termux-backup-$(date +%Y%m%d).tar.gz"
}

# System info
sysinfo() {
    echo "══════════════════════════════════════════════════════"
    echo "System Information"
    echo "══════════════════════════════════════════════════════"
    echo "User     : $(whoami)"
    echo "Host     : $(hostname)"
    echo "Date     : $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Uptime   : $(uptime -p)"
    echo "Memory   : $(free -h | grep Mem | awk '{print $3"/"$2}')"
    echo "Storage  : $(df -h /data | tail -1 | awk '{print $4}') free"
    echo "══════════════════════════════════════════════════════"
}

# Initialize
sysinfo