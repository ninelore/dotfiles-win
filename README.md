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

### Android SDK tools setup

```bash
sudo apt install openjdk-8-jdk-headless zip unzip
wget https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip
mkdir android-sdk
unzip commandlinetools-linux-6200805_latest.zip -d $HOME/android-sdk
# restart terminal/shell
sdkmanager --sdk_root=${ANDROID_HOME} "tools"
sdkmanager --update
sdkmanager "build-tools;28.0.3" "platform-tools" "platforms;android-28" "tools"
sdkmanager --licenses
sudo apt install gradle
```

