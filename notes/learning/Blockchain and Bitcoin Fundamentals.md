---
dg-publish: true
---
# Blockchain and Bitcoin Fundamentals

link: <https://udemy.com/course/blockchain-and-bitcoin-fundamentals/>

## Blockchain

Definition:

> A blockchain is a constantly growing ledger that keeps a permanent record of all the transactions that have taken place, in a secure, chronological and immutable way.


### Bitcoin Network

A network of computers that keep track of bitcoin transactions. It uses the blockchain technology to achieve that.


### Bitcoin Miners

> Miners, are groups of participants in the bitcoin network that actually build the blocks.

Mining is "Process and confirm transactions."

The more miners there are, the more secure the network is.

Miners solve complex cryptograph math to validate the authenticity of blocks and are rewarded in bitcoin.


### Bitcoin Hash

Block hashing: <https://demoblockchain.org/block>

A valid hash has 4 leading zeros.

Nonce = Number used once

Mining is calculating the Nonce that will give us a valid hash.


> [!question]
> It seems to me that as time passes, the cost of keeping track of all the transactions grows indefinitely. Is that true?

> o trilema da blockchain: a comunidade chegou no consenso de que você só pode escolher dois entre **segurança**, **descentralização** e **desempenho**.
> 
> Blockchains públicas tem sacrificado o desempenho, pois valorizam demais os outros dois.



### The Four Components of Bitcoin

1. Software
2. Cryptography
3. Hardware
4. Gaming Theory (what?!)

- Bitcoin Software
- New cryptography challenge approximately every ten minutes
- Global Bitcoin miner community
    - race to solve the challenge
    - a miner solves the cryptography challenge first
    - then the rest of the community verifies the validity of the new block mined
    - the new block of transactions is added to the bitcoin blockchain
- the winning miner earns a reward for solving the challenge first
    - **this is how bitcoins are created**



### Coinbase

is a site and a feature of bitcoin.

Coinbase transaction is the first transaction of a block with the amount of bitcoins the miner was rewarded for being the first one to mine that block (to solve the cryptographic challenge sent to the bitcoin network).

### Bitcoin Explorer

It's a service where you can visualize the blocks in the Bitcoin Blockchain.


### The Value of Blockchain

Blockchain supports 3 key areas

- Value
    - enables a unique asset to be transferred over the Internet without a middle centralized agent.
- Trust
    - Creates a permanent, secure and unalterable record of who owns what. Using advanced cryptography, "Information integrity" is preserved.
- Reliability
    - Decentralized network structure ensures that there is no single point of failure which could bring the entire system down.


### Cryptocurrency

> Cryptocurrency is a type of digital asset which can be used to exchange value between parties.
> 
> **It uses cryptography to secure how it's transferred** and to **control the creation of new units of that currency**.


### Smart Contracts

> Smart Contracts, also known as Smart Code or Smart Property, are computer protocols that can act as a contract.
>
> A Smart Contract can handle **autonomously** the enforcement and fulfillment of a contract without needing a third party to oversee that the contract is executed.


Key points about Smart Contracts

- two or more parties
- more than sending virtual currency
- automated
- disintermediated (autonomous)
- immutable
- trustless (you need to be able to check the transaction in the block chain)

### Digital Tokens

> A token is a digital asset that can represent anything. Some examples include securities, loyalty points and real world assets.
> 
> A token smart contract is a smart contract which is built on a smart contract platform such as Ethereum. These tokens can be exchanged securely over the Internet.


examples of digital tokens being used:

- steemit - rewards platform for content publishers
- golem.network - share economy computing power
- filecoin - shared economy cloud storage
- MANA - cryptocurrency for decentraland
- CryptoKitties - collect and breed digital cats (NFTs)


### DAOs and DACs

- DAO: Decentralized Autonomous Organization
- DAC: Decentralized Autonomous Corporation

- DAO
    - Collection of smart contracts
    - Distributed networks on a Blockchain
    - Internet of Things (IoT)
    - Artificial Inteligence


### Business usecases of Blockchain


5 examples

5. supply chain management (IBM, Walmart, pork food)
4. real state (astralian banks ANZ and Westpac)
3. insurance (maersk, microsoft)
2. certificates of authenticity (DNV, Deloitte)
1. Humanitarian Aid (United Nations World Food Programme)


### Limitations of Blockchain Technology

- Early stage (changing constantly)
- Lack of awareness
- Limited available technical talent
- It is immutable
    - No reversals or modifications
- Key management
- Scalability
- Time to Process


### Common Misconceptions

- Bitcoin is anonymous
    - (it's actually pseudonymous)
- Bitcoin is used to launder money
    - The blockchain keeps track of every transaction
    - in order to exchange bitcoin for fiat money (like dollars) you need to KYC - Know Your Customer
- Blockchain is a better database
    - Well, it's not...
- Blockchain is Bitcoin
    - Bitcoin uses the blockchain technology.

### Bitcoin vs Bitcoin Cash

Bitcoin cash is a new cryptocurrency developed from a hard-fork in the bitcoin blockchain.

The fork started on 2017-08-01, at block 478,558

Created mainly to solve the limit of 1MB for the block size.

See details in <https://bitcoincash.org/>.


### Bitcoin Forks and Segregated Witness (SegWit)

> A Fork takes place when a blockchain splits into two different paths forward.

#### Interesting facts about forks

1. forks on Bitcoin happen on a regular basis
2. Two or more miners solve a block at the same time - for a while there are extra chains.
3. Eventually one of the chains wins over the other (the more miners merge with one specific chain over the others, the longest chain wins and everybody follows it)
4. Orphan block(s)
5. Back to the Mempool (a place where transactions are kept waiting to confirm).


#### Hard-forks vs. Soft-forks

- Hard-fork: introduces a change that forces everyone to upgrade.
- Soft-fork: introduces change that is backwards compatible. Doesn't need upgrade.

Hard-fork: Bitcoin Cash

SegWit Soft Fork:

- UASF: User Activated Soft Fork
- Locked-in on 2017-08-08, at block 479,707
- Official activation on 2017-08-24 at block 481,824
- Did not cause a split in chain
- Replaces **block size limit** with **block weight limit**.

#### What is Segregate Witness

- Protocol Upgrade
- Improves scalability without increasing block size
- Does not require upgrading to remain on the blockchain
- Did not cause a split in the chain

Contents of a Bitcoin Transaction:

 - input
 - amount
 - output


### How many transactions are in a block?

- Limited by how many transactions fit within the maximum "block weight"
- weight units



### The Controlled Supply of Bitcoins

Halving happens every 210,000 blocks (about every 4 years)

- 2009-01-03 - Genesis - 50 bitcoins per block
- 2012-11-28 - First halving - 25 btc/block
- 2016-07-09 - Second halving - 12.5 btc/block
- 2020-05-11 - Third halving - 6.25 btc/block


### What happens when there are no more bitcoins left to mine?

Miners will get compensation for the transaction fees.


### Important Dates in Bitcoin History

- 2008-10-31: bitcoin whitepaper
- 2009-01-03: genesis block
- 2010-05-22: pizza day -> first retail purchase 2 pizzas for 10,000 bitcoins (1 BTC = 0.0025 USD)
- 2013-11-28: 1 BTC > 1,000 USD
- 2017-03-02: 1 BTC > 1 Oz of Gold

### Merkle Trees

 > A Merkle Tree is a mathematical data structure composed of hashes of different blocks of data, and which serves as a summary of all the transactions in a block.
 
