#  /$$$$$$$  /$$$$$$$  /$$$$$$  /$$$$$$  /$$      /$$
# | $$__  $$| $$__  $$|_  $$_/ /$$__  $$| $$$    /$$$
# | $$  \ $$| $$  \ $$  | $$  | $$  \__/| $$$$  /$$$$
# | $$$$$$$/| $$$$$$$/  | $$  |  $$$$$$ | $$ $$/$$ $$
# | $$____/ | $$__  $$  | $$   \____  $$| $$  $$$| $$
# | $$      | $$  \ $$  | $$   /$$  \ $$| $$\  $ | $$
# | $$      | $$  | $$ /$$$$$$|  $$$$$$/| $$ \/  | $$
# |__/      |__/  |__/|______/ \______/ |__/     |__/

# Enviroment Variables
export SUDO_EDITOR="nvim"
export ZSH="$HOME/.oh-my-zsh"
export LC_ALL="en_IN.UTF-8"
export PYTHONPATH="/usr/bin/python3"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4" # set catppuccin color for fzf

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
zstyle ':omz:update' frequency 7
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(
	git
	eza
	fzf
	kitty
	python
	colorize
	starship
	colored-man-pages
	zsh-interactive-cd
	fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Pacman aliases
alias up='yay -Syu'                                                         # update system
alias search='yay -Ss'                                                      # Search for packages
alias unlock="sudo rm /var/lib/pacman/db.lck"                               # remove pacman lock
alias cleanup='yes | sudo pacman -Rns $(pacman -Qtdq) && sudo pacman -Scc ' # remove orphaned packages

# Colorize grep output (good for log files)
alias grep='grep --color=auto'   # add colors to grep
alias egrep='egrep --color=auto' # add colors to egrep
alias fgrep='fgrep --color=auto' # add colors to fgrep

# cp, mv & rm aliases
alias mv='mv -iv'                                                # Add and verbose
alias rm='rm -if'                                                # Add promt and forcefully flag
alias cp="rsync -avh --inplace --no-whole-file --info=progress2" # Change cp with rsync

# system power aliases
alias shn='shutdown now'    # shutdown
alias srn='shutdown -r now' # reboot

# Service aliases
alias stop='sudo systemctl stop '
alias start='sudo systemctl start '
alias status='sudo systemctl status '
alias enable='sudo systemctl enable '
alias restart='sudo systemctl restart '
alias disable='sudo systemctl disable '

# Grub aliases
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg' # update grub shorthand

# Extra aliases
alias bc='eva'       # calculator
alias py='python3'   # python
alias df='dust -r'   # use dust instead of df
alias free='free -m' # show sizes in MB
alias tf='terraform '
alias docker-ui='oxker'
alias st='systemctl-tui'
alias gitfetch='onefetch'
alias neofetch='fastfetch'
alias speedtest="speedtest++"
alias date='date "+%d-%b-%Y %I:%M %p"'
alias aws-test='aws sts get-caller-identity'                                                         # test account connection with AWS
alias cmatrix='cxxmatrix -m FOSSIL --frame-rate=30 --rain-density=2.0'                               # advance cmatrix
alias p10kup='git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull'               # to update powerlevel10k
alias cat='bat --theme "mocha" --italic-text always --style "header-filename,header-filesize,grid" ' # run cat -> bat with arguments

# Changing "ls" to "eza"
alias l.='eza -a --color=always | grep -E "^\."'
alias la='eza -a --icons --group-directories-first --git --time-style=relative --no-filesize --color=always --color-scale all '
alias ls='eza -l --icons --group-directories-first --git --time-style=relative --no-filesize --color=always --color-scale all '
alias ll='eza -al --icons --group-directories-first --git --time-style=relative --no-filesize --color=always --color-scale all '

alias reflector='sudo reflector --protocol https --latest 100 --sort rate --number 50 --save /etc/pacman.d/mirrorlist'

# Run atuin
eval "$(atuin init zsh)"
#[ PRISM of RUINS ] — From ruins, light.
# End of File
