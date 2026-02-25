#!/bin/bash
set -e

echo "==> Verificando Ruby..."
if ! command -v ruby &>/dev/null; then
  echo "    Ruby não encontrado. Instalando via apt..."
  sudo apt update -y
  sudo apt install -y ruby-full build-essential zlib1g-dev
else
  echo "    Ruby $(ruby --version) OK"
fi

echo "==> Verificando Bundler..."
if ! command -v bundle &>/dev/null; then
  echo "    Instalando Bundler..."
  gem install bundler --user-install
  export PATH="$HOME/.local/share/gem/ruby/$(ruby -e 'puts RbConfig::CONFIG["ruby_version"]')/bin:$PATH"
else
  echo "    Bundler $(bundle --version) OK"
fi

echo "==> Instalando dependências do projeto..."
bundle install

echo ""
echo "✓ Ambiente pronto!"
echo ""
echo "  Para subir o site localmente:"
echo "    bundle exec jekyll serve"
echo ""
echo "  Acesse: http://localhost:4000"
