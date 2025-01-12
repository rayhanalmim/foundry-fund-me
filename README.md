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
$ forge test -vvvv --match-test testPriceVersionInAccurate
```


### See the test statisties on the project 
```shell
$ forge coverage --fork-url $SEPOLIA_RPC

```


