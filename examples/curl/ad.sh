#!/usr/bin/env bash
# Zap Imóveis Ad API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./ad.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://api.piloterr.com/v2/zapimoveis/ad" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=https://www.zapimoveis.com.br/imovel/venda-apartamento-3-quartos-mobiliado-jardim-paulista-zona-sul-sao-paulo-sp-170m2-id-2912096343/
