### Install Dependency

```shell
$ forge install smartcontractkit/chainlink-brownie-contracts@1.3.0 --no-commit

```
### Test a specific function with details

```shell
$ forge test -vvvv --match-test testPriceVersionInAccurate

```
### Test a specific function with fork
 - make sure it's only done when i will be nessesary because using fork url can increase our rpc provider acount bill.
```shell
$ forge test -vvvv --match-test testPriceVersionInAccurate --fork-url $SEPOLIA_RPC
```


### See the test statisties on the project 
```shell
$ forge coverage --fork-url $SEPOLIA_RPC

```

### calculate gas of a indivitual fucntion 
```shell
$ forge snapshot --match-test testPriceVersionInAccurate

```
### check storage of an contract
```shell
$ forge inspect FundMe storageLayout

```
### check storage each slot details using hash and etherscan
- we have to deploy it first then check with the deployment url 
```shell
$ cast storage 0x............contractDeployAddress 

```
### install devops package
- we have to deploy it first then check with the deployment url 
```shell
$ forge install Cyfrin/foundry-devops --no-commit

```
### run a script
```shell
$ forge script script/example.sol:contractName --rpc-url ... --private-key ...

```


