#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

mkdir -p abis

: "${SOROBAN_RPC_URL:=https://soroban-testnet.stellar.org}"
: "${STELLAR_NETWORK:=testnet}"

echo "Building contracts for $STELLAR_NETWORK via $SOROBAN_RPC_URL"
cargo build --target wasm32-unknown-unknown --release

cat > abis/deployed.testnet.json <<JSON
{
  "network": "$STELLAR_NETWORK",
  "rpc_url": "$SOROBAN_RPC_URL",
  "invoice_contract_id": "${INVOICE_CONTRACT_ID:-C...}",
  "treasury_contract_id": "${TREASURY_CONTRACT_ID:-C...}",
  "compliance_contract_id": "${COMPLIANCE_CONTRACT_ID:-C...}",
  "generated_at": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
}
JSON

echo "Contract deployment metadata written to abis/deployed.testnet.json"
echo "Replace placeholder IDs with soroban contract deploy output before backend integration."
