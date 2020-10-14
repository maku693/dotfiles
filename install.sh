#! /bin/sh
cd `dirname $0`

git submodule update --init --depth 1

targets=`cat << EOF
.gitignore_global
.gvimrc
.vim
.vimrc
.zshrc
EOF
`
for f in $targets; do
  ln -si "$PWD/$f" "$HOME"
done

gitconfig() {
  local current_config=`git config --global $1`

  if [ -n "$current_config" ]; then
    printf "git config: set $1 to '$2'? "
    read yn
    ! expr "$yn" : '\([Yy]\(es\)\{0,1\}\)' > /dev/null && return
  fi

  git config --global $1 $2
}
gitconfig core.excludesfile "$HOME/.gitignore_global"
gitconfig init.defaultBranch main
gitconfig push.default upstream
gitconfig status.branch 'true'
gitconfig status.short 'true'
gitconfig user.email me@maku693.net
gitconfig user.name maku693
