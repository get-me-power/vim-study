# Vim勉強会

これはサンプルのリポジトリです。

## 使うプラグインマネージャー

- vim-plug

## インストールされるVimプラグイン

- vim-airline
- vim-airline-themes
- vim-easymotion
- gina.vim
- vim-fugitive
- fzf
- fzf.vim

# 実行する手順 (Unix)


1. このリポジトリをフォークします
2. 以下のコマンドを実行します

    ```bash
        git clone https://github.com/{your github name}/vim_study ~/.vim
    ```
3. vim-plugをインストールします

    ```bash
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
4. Vimを起動します
5. :PlugInstallを実行します
