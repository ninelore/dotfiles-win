# My dotfiles for my windows + WSL workflow (work in progress)

## Setup
(Note: backslashes are used for things to do in Windows, forward-slashes for things to do inside WSL!)

- (optional) put powershell profile in `$USER\Documents\PowerShell\`
- install windows terminal settings by opening the json via the terminal settings and paste the contents from the settings.json there
- install WSL2 and Ubuntu if not done so already
- install dependencies listed in `wsl-dots\requirements.txt` to WSL2
- copy everything from `wsl-dots\config` to `$HOME/.config/` in WSL
- copy everything from `wsl-dots/home` to `$HOME/` and prepend a dot where applicapable
- run `wsl-dots/install-vimplug-ohmyzsh.sh`
- (WIP)

