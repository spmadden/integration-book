#!/bin/bash

if ! command -v cargo &> /dev/null ; then
	echo "missing cargo, will install using rustup.rs"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
	PATH=~/.cargo/bin:$PATH
fi
echo "Found cargo version $(cargo --version)"

if ! command -v just &> /dev/null; then
  cargo install just
fi
echo "Found just at $(command -v just)"

