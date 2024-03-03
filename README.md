
# How to Raise the Gas Limit

This repository is for the validation and replication of results from the How to Raise the Gas Limit blogpost series. This repository is not intended to be a versatile software library.

## Methodology

### Data Collection

**On chain** data was collected using [cryo](https://github.com/paradigmxyz/cryo)

Collected cryo datasets:
- blocks
- contracts
- logs
- state diffs

**Node client** data was collected from the documentation and user reports from each node client. These numbers are compiled into [this spreadsheet]().

### Data processing

State growth computed using the state diffs dataset as the number of storage slots changing from a zero value to a non-zero value, minus the number of storage slots changing from a non-zero value to a zero value.
- For **Figure 2**, state growth is computed for each contract and then summed for each hierarchical category.
- For **Figure 3**, state growth is computed for each contract category for each month of Ethereum's history.

### Data visualization

Data was visualized using [plotly](https://plotly.com/)

## Labels

Labels were compiled from many different sources on a best effort basis. This is not a complete collection of tags. If you would like to suggest a correction or improvement to the labels, please file a PR.

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

Contracts were taken to be non-overlapping. A small portion of ERC-20 tokens were categorized under DeFi / DEX instead of the ERC-20 because it is a more specific fit (e.g. Uniswap pools).

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

