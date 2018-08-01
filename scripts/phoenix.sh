#!/usr/bin/env bash

echo "-- phoenix.sh"
  
# https://elixir-lang.org/install.html#unix-and-unix-like
# https://hexdocs.pm/phoenix/installation.html


echo "-- erlang instalation"
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb

sudo apt-get update

sudo apt-get -y install esl-erlang
sudo apt-get -y install elixir

mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

echo "-- inotify-tools (for linux users)"

sudo apt-get -y install inotify-tools

echo "-- end phoenix.sh"