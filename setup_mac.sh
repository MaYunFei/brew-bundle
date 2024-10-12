Mac Setup Script

#!/bin/bash

# 检查是否已安装Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# 安装Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# 安装和配置Zsh插件
echo "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 配置.zshrc文件
echo "Configuring .zshrc..."
sed -i '' 's/plugins=(git)/plugins=(git sublime z zsh-syntax-highlighting zsh-autosuggestions git-flow)/' ~/.zshrc

# 安装git-flow
echo "Installing git-flow..."
brew install git-flow

curl -sL https://raw.githubusercontent.com/MaYunFei/brew-bundle/main/Normal_Brewfile | brew bundle --file=-

