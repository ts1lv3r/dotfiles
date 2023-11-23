### Powerlevel10k Configuration

```bash
p10k configure
```

### NerdFont Installation

```txt
# If you executed the install script, 'Nerd Font' already be installed in your env.
# So, You should change fonts config on editor setting for using 'Nerd Font'.
```

### ChatGPT.nvim Configuration

```bash
echo "export OPENAI_API_KEY=<api_key>" > $HOME/.openai_key.zsh
echo "export OPENAI_API_HOST=api.openai.com" >> $HOME/.openai_key.zsh
```

### Migrating from Packer.nvim to Lazy.nvim

```bash
rm -rf ~/.local/share/nvim/site/pack/packer
rm ~/.config/nvim/plugin/packer_compiled.lua
```

### LSP For C/C++ Project

```bash
sudo apt-get install bear
ls
Makefile  <name>.c

bear -- make
ls
Makefile  <name>.c  ...  compile_commands.json
```
