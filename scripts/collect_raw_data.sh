#!/usr/bin/env bash

# this script collects the raw data for the article "How to Raise the Gas Limit, Part 1: State Growth"

# block range
BLOCKS=":19.34M"

# blocks
cryo blocks -b $BLOCKS --include-columns gas_used gas_limit \
    --subdirs datatype --reorg-buffer 1000

# transactions
cryo txs -b $BLOCKS --include-columns n_rlp_bytes gas_used gas_limit \
    --subdirs datatype --reorg-buffer 1000

# logs
cryo logs -b $BLOCKS --inner-request-size 100 --subdirs datatype --reorg-buffer 1000

# uniswap v2 pools
cryo logs \
    --label uniswap_v2_pools \
    --blocks $BLOCKS \
    --reorg-buffer 1000 \
    --subdirs "uniswap_v2_pools" \
    --contract 0x5c69bee701ef814a2b6a3edd4b1652cb9cc5aa6f \
    --event-signature "PairCreated(address indexed token0, address indexed token1, address pair, uint)" \
    --topic0 0x0d3648bd0f6ba80134a33ba9275ac585d9d315f0ad8355cddefde31afa28d0e9

# uniswap v3 pools
cryo logs \
    --label uniswap_v3_pools \
    --blocks $BLOCKS \
    --reorg-buffer 1000 \
    --subdirs "uniswap_v3_pools" \
    --contract 0x1f98431c8ad98523631ae4a59f267346ea31f984 \
    --event-signature "PoolCreated(address indexed token0, address indexed token1, uint24 indexed fee, int24 tickSpacing, address pool)" \
    --topic0 0x783cca1c0412dd0d695e784568c96da2e9c22ff989357a2e8b1d9b2b4e6b7118


# state diffs
cryo state_diffs \
    --blocks $BLOCKS \
    --subdirs datatype \
    --reorg-buffer 1000 \

# erc20 transfers
cryo erc20_transfers \
    --blocks $BLOCKS \
    --subdirs datatype \
    --chunk-order reverse \
    --reorg-buffer 1000 \

# erc721 transfers
cryo erc721_transfers \
    --blocks $BLOCKS \
    --subdirs datatype \
    --chunk-order reverse \
    --reorg-buffer 1000 \

# contracts
cryo contracts \
    --blocks $BLOCKS \
    --subdirs datatype \
    --chunk-order reverse \
    --reorg-buffer 1000 \

