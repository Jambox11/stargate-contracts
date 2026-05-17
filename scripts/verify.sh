#!/usr/bin/env bash
set -euo pipefail

test -f abis/invoice.json
test -f abis/treasury.json
test -f abis/deployed.testnet.json
echo "ABI metadata present."
