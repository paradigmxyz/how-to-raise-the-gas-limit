
# How to Raise the Gas Limit

This repository is for the validation and replication of results from the How to Raise the Gas Limit blogpost series.

*This repository is not intended to be a versatile / polished / well-supported software library. In the future, the reusable portions of this code may be assembled into such a library.*

## Methodology

### Data Collection

**On chain** data was collected using [cryo](https://github.com/paradigmxyz/cryo)

The main relevant cryo datasets are `blocks`, `state_diffs`, and `contracts`. Some additional datasets were used for constructing sets of contract labels. [This script](scripts/collect_data.sh) shows an example of collecting this data.

**Node client** data was gathered from 1) node client documentation and 2) user reports. These numbers are compiled into [this spreadsheet](https://docs.google.com/spreadsheets/d/1NxyLBqPX6JVMqGqb-kVcWCN0bm8eXmxZmvrKqAS6Xw4/edit#gid=0). A csv version of the reth data is saved in the `./data` directory.

### Data processing

State growth was computed using the `state_diffs` dataset. State growth was defined as the number of storage slots changing from a zero value to a non-zero value, minus the number of storage slots changing from a non-zero value to a zero value.
- For **Figure 2**, state growth is computed for each contract and then summed for each hierarchical category.
- For **Figure 3**, state growth is computed for each contract category for each month of Ethereum's history.

[This notebook](notebooks/htrtgl_extract_monthly_data.ipynb) shows how data was preprocessed, and [this notebook](notebooks/htrtgl_state_growth_figures.ipynb) shows how figures were generated.

### Data visualization

Data was visualized using [plotly](https://plotly.com/)

### Code

Many of the utilities for processing and pipelining the data are gathered into [this repository](https://github.com/paradigmxyz/state_growth).

## Labels

Labels were compiled from many different sources. They are collected on a best effort basis and they do not cover all addresses. If you would like to suggest a correction or improvement to the labels, please file a PR.

Contract addressess were divided into the following 10 categories:
- ERC-20: contracts that have emitted a `Transfer(address indexed, address indexed, uint256 indexed)`
- ERC-721: contracts that have emitted a `Transfer(address indexed, address indexed, uint256 indexed)`
- ERC-1155: contract have emitted a `TransferSingle(...)`
- Infra: infrastructure including multisigs, oracles, domain names, and staking modules
- Bridge: bridges to L2's or other L1's
- Game: games
- Gambling: Explicit gambling protocols
- Scam / Scheme: known scams, MLM schemes, or other protocols of a similar flavor
- Other: everything else, including addresses that could not be identified

Categories were taken to be non-overlapping. A small portion of ERC-20/ERC-721 tokens were categorized under DeFi / DEX instead of the ERC-20 because it is a more specific fit (e.g. Uniswap pools).

The contracts of each protocol were identified using a variety of sources including:
- on chain logs
- protocol documentation websites
- github repos
- search engines
- block explorers
- [spreadsheets](https://docs.google.com/spreadsheets/d/1VdRMFENPzjL2V-vZhcc_aa5-ysf243t5vXlxC2b054g/edit#gid=0)
- [address lists](https://blockchaingame.world/addresses)
- [tag datasets](https://www.kaggle.com/datasets/hamishhall/labelled-ethereum-addresses)
- [tag databases](https://www.walletlabels.xyz/)

Some of the tags are in the [`state_growth`]() repo, others are in [this notebook](notebooks/htrtgl_labels.ipynb).

