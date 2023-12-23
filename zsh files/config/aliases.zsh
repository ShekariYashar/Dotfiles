# Aliases

# Command with color output
alias grep='grep --color'

# 'exa' is a modern replacement for 'ls' with more features and better defaults
alias ls="exa --icons --group-directories-first"
alias la="exa --icons --group-directories-first -la"
alias ll="exa --icons --group-directories-first -la"

# Run Burp Suite
alias burpo='java -jar ~/Downloads/Burp.Suite.Professional.2023.11.1.3/BurpLoaderKeygen117.jar &'

# Package management with 'nala'
alias pinstall='sudo nala install -y'
alias pupdate='sudo nala upgrade -y'

# -----Shell Functions-----

# Function to handle apt-fast command
apt-fast() {
	if [[ $1 = "install" ]] && [[ $2 != "-y" ]]; then
		sudo nala "$@" -y
	elif [[ $1 == "upgrade" ]] && [[ $2 != "-y" ]]; then
		command apt-fast update && apt-fast upgrade -y
	else
		command apt-fast "$@"
	fi
}

# Function to handle nala command
nala() {
	if [[ $1 = "install" ]] && [[ $2 != "-y" ]]; then
		sudo nala "$@" -y
	elif [[ $1 == "upgrade" ]] && [[ $2 != "-y" ]]; then
		sudo nala upgrade -y
	else
		nala "$@"
	fi
}
# Function to handle apt command
apt() {
	if [[ $1 = "install" ]] && [[ $2 != "-y" ]]; then
		sudo nala "$@" -y
	elif [[ $1 == "upgrade" ]] && [[ $2 != "-y" ]]; then
		command apt-fast update && apt-fast upgrade -y
	else
		command apt-fast "$@"
	fi
}

copy_buffer_p() {
	if command -v clipcopy &>/dev/null; then
		printf "%s" "$BUFFER" | clipcopy
	else
		zle -M "clipcopy not found. Please make sure you have Oh My Zsh installed correctly."
	fi
}
