#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

print_info() {
  # Print output in blue
  printf "\n\e[00;34m  [..] $1\e[0m\n"
}

print_question() {
  # Print output in yellow
  printf "\e[0;33m  [?] $1\e[0m\n"
}

print_success() {
  # Print output in green
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_fail() {
  # Print output in red
  printf "\e[0;31m  [✖] $1 $2\e[0m\n"
  echo ''
  exit
}

# Installation de Homebrew
print_info "Vérification de l'installation de Homebrew."
brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
  print_success "Homebrew est déja installé"
else
  print_info "Installation de Homebrew. Homebrew nécessite des outils de ligne de commande osx, veuillez d'abord télécharger xcode first."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

print_info "Installation des paquets système."
packages=(
  "node"
  "tmux"
  "fish"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

# Basculer shell en fish.
print_info "Basculer shell en fish. Vous devrez peut-être vous déconnecter."

sudo sh -c "echo $(which fish) >> /etc/shells"
chsh -s $(which fish)


echo ''
print_success 'Tous installés!'
