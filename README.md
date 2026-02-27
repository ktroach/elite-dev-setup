# 🔥 Elite Dev Setup

A fully riced terminal dev environment for Ubuntu featuring NvChad + tmux + Nerd Fonts. Clone it, follow the steps, and go from stock terminal to elite dev cockpit in under 30 minutes.

![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-E95420?style=flat&logo=ubuntu&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-0.12-57A143?style=flat&logo=neovim&logoColor=white)
![tmux](https://img.shields.io/badge/tmux-riced-1BB91F?style=flat)
![License](https://img.shields.io/badge/license-MIT-blue?style=flat)

---

## ⚡ New Machine Quickstart

Already done this before? Here's the full setup in one shot:

```bash
# 1. Install dependencies
sudo apt install -y git curl unzip ripgrep gcc make nodejs npm

# 2. Install Nerd Font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/AnonymousPro.tar.xz
mkdir -p ~/.local/share/fonts/AnonymousPro
tar -xf AnonymousPro.tar.xz -C ~/.local/share/fonts/AnonymousPro
fc-cache -fv && rm AnonymousPro.tar.xz

# 3. Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 4. Install latest Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
rm nvim-linux-x86_64.tar.gz

# 5. Clone and apply dotfiles
git clone git@github.com:ktroach/elite-dev-setup.git
cp -r elite-dev-setup/nvim ~/.config/
cp elite-dev-setup/.tmux.conf ~/

# 6. Set up tmux (then press Ctrl+a I to install plugins)
tmux source ~/.tmux.conf

# 7. Open nvim — lazy.nvim will auto-install everything
nvim
```

> ⚠️ Don't forget to set **AnonymicePro Nerd Font Mono** in your terminal font preferences!

---

## 📸 What You Get

- **NvChad** — blazing fast Neovim config with catppuccin theme, NvDash dashboard, 27 plugins, ~9ms startup
- **tmux** — catppuccin status bar with live CPU/RAM stats, session persistence, vim keybindings
- **AnonymicePro Nerd Font Mono** — icons rendering perfectly across tmux and nvim
- **Full LSP stack** — TypeScript, Rust, Tailwind, ESLint, Prettier, CSS, HTML via Mason
- **Treesitter** — rich syntax highlighting for your whole stack

---

## 🛠 Prerequisites

```bash
sudo apt install -y git curl unzip ripgrep gcc make nodejs npm
```

---

## 🔤 Step 1 — Install Nerd Font

Nerd Fonts patch developer fonts with thousands of icons. Without them, tmux and NvChad will show broken placeholder squares instead of icons.

**Install AnonymicePro Nerd Font Mono (recommended):**

```bash
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/AnonymousPro.tar.xz
mkdir -p ~/.local/share/fonts/AnonymousPro
tar -xf AnonymousPro.tar.xz -C ~/.local/share/fonts/AnonymousPro
fc-cache -fv
rm AnonymousPro.tar.xz
```

**Other great options:**

```bash
# 0xProto (clean, modern, great for code)
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/0xProto.tar.xz
mkdir -p ~/.local/share/fonts/0xProto
tar -xf 0xProto.tar.xz -C ~/.local/share/fonts/0xProto
fc-cache -fv && rm 0xProto.tar.xz

# FiraCode (ligatures!)
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz
mkdir -p ~/.local/share/fonts/FiraCode
tar -xf FiraCode.tar.xz -C ~/.local/share/fonts/FiraCode
fc-cache -fv && rm FiraCode.tar.xz

# CascadiaCode
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.tar.xz
mkdir -p ~/.local/share/fonts/CascadiaCode
tar -xf CascadiaCode.tar.xz -C ~/.local/share/fonts/CascadiaCode
fc-cache -fv && rm CascadiaCode.tar.xz
```

**⚠️ Critical:** Always select the **Mono** variant in your terminal font settings (e.g. `AnonymicePro Nerd Font Mono` not `AnonymicePro Nerd Font`). The Mono variant ensures icon widths align correctly in the terminal grid.

**Set the font in GNOME Terminal:**
1. Open terminal → hamburger menu (≡) → **Preferences**
2. Select your profile → **Text** tab
3. Toggle **"Use custom font"** on
4. Search for your font and select the **Mono** variant
5. Close and reopen the terminal

---

## 📦 Step 2 — Install tmux Plugin Manager (TPM)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

---

## ⚙️ Step 3 — Apply Dotfiles

```bash
git clone git@github.com:ktroach/elite-dev-setup.git
cp -r elite-dev-setup/nvim ~/.config/
cp elite-dev-setup/.tmux.conf ~/
```

---

## 🖥 Step 4 — Set Up tmux

```bash
tmux source ~/.tmux.conf
```

Open tmux and install plugins:
```
Ctrl+a then I   (capital i)
```

Let TPM install all plugins. Your status bar should now show CPU%, RAM%, and the time with catppuccin colors.

**tmux prefix is `Ctrl+a`** (remapped from default `Ctrl+b`).

| Shortcut | Action |
|---|---|
| `Ctrl+a \|` | Split pane vertically |
| `Ctrl+a -` | Split pane horizontally |
| `Ctrl+a h/j/k/l` | Navigate panes (vim-style) |
| `Ctrl+a z` | Zoom pane fullscreen |
| `Ctrl+a s` | Switch sessions |
| `Ctrl+a $` | Rename session |
| `Ctrl+a Ctrl+s` | Save session (resurrect) |
| `Ctrl+a Ctrl+r` | Restore session |

---

## 📝 Step 5 — Install Neovim

Ubuntu's apt version of Neovim is too old. Install the latest:

```bash
sudo apt-get install -y ninja-build gettext cmake unzip curl build-essential
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
rm nvim-linux-x86_64.tar.gz
```

---

## 🚀 Step 6 — Set Up NvChad

```bash
nvim
```

On first launch, lazy.nvim will auto-install all 27 plugins. Let it finish, then run:

```
:MasonInstallAll
```

Then install LSP servers for the full dev stack:

```
:MasonInstall typescript-language-server rust-analyzer tailwindcss-language-server prettier eslint-lsp
```

Fix treesitter parsers:

```
:TSInstall lua javascript typescript tsx rust
```

---

## 🎨 NvChad Key Shortcuts

| Shortcut | Action |
|---|---|
| `Space f f` | Find files |
| `Space f g` | Live grep / search in files |
| `Space e` | Toggle file tree |
| `Space t h` | Theme switcher (68 themes!) |
| `Space c h` | Cheatsheet |
| `g d` | Go to definition |
| `K` | Hover docs |
| `Space x x` | Diagnostics panel |
| `Space g g` | LazyGit (if installed) |

---

## 📦 Installed LSP Servers

| Server | Language |
|---|---|
| `ts_ls` | TypeScript / JavaScript |
| `rust_analyzer` | Rust |
| `tailwindcss` | Tailwind CSS |
| `eslint` | ESLint |
| `prettier` | Formatting |
| `cssls` | CSS |
| `html` | HTML |
| `lua_ls` | Lua |
| `stylua` | Lua formatting |

---

## 🔧 Updating

**Update tmux plugins:**
```
Ctrl+a then U
```

**Update NvChad plugins:**
```
:Lazy update
```

**Update LSP servers:**
```
:MasonUpdate
```

---

## 📁 Structure

```
elite-dev-setup/
├── nvim/               # NvChad config
│   ├── init.lua        # Entry point
│   └── lua/
│       ├── chadrc.lua  # Theme & UI config
│       ├── mappings.lua
│       ├── options.lua
│       ├── plugins/
│       │   └── init.lua
│       └── configs/
│           ├── lspconfig.lua
│           └── conform.lua
└── .tmux.conf          # tmux config
```

---

## 🙏 Credits

- [NvChad](https://github.com/NvChad/NvChad) — Neovim config framework
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) — Patched fonts with icons
- [TPM](https://github.com/tmux-plugins/tpm) — tmux plugin manager
- [Catppuccin](https://github.com/catppuccin/catppuccin) — The GOAT color scheme 🐱
