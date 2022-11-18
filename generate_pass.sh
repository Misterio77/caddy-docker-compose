#!/usr/bin/env bash

set -euo pipefail

if ! openssl version &> /dev/null; then
    echo "Você precisa do openssl para gerar a senha"
    exit 1
fi

if [ -e db_pass.secret ]; then
    echo "O arquivo db_pass.secret já existe"
    exit 2
fi

openssl rand -base64 12 > db_pass.secret
echo "Senha gerada: $(cat db_pass.secret)"
