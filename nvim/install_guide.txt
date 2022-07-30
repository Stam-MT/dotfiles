
# install nvim
- sudo apt install neovim


# setup init file
- create directory ~/.config/nvim
- copy init.vim file to ~/.config/nvim


# install vim plugin manager vimplug
- sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# install nvim plugins mentioned in init.vim
- open nvim
- execute command :PluginInstall


# install language servers
- create directory ~/.config/nvim/lua
- copy file to ~/.config/nvim/lua/lsp_config.lua
- copy file to ~/.config/nvim/lua/lua_config.lua 

## Python (pylsp)
- sudo apt install python3-pip
- pip3 install 'python-lsp-server[all]'
- add content to the bottom of lsp_config.lua:
  lsp.pylsp.setup{on_attach=custom_attach}

## C# (csharp-ls)
- dotnet tool install --global csharp-ls
- add content to the bottom of lsp_config.lua:
  lsp.csharp-ls.setup{on_attach=custom_attach}
