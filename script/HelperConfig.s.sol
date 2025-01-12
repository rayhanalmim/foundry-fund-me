// SPDX-License-Identifier: MIT

// 1. Deploy On the mock when we are on the local available chain
// 2. keep tract of the contract address accross different chains
// sepolia ETH/USD 
// Mainnet ETH/USD 

pragma solidity ^0.8.28;
import {Script} from "../lib/forge-std/src/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggeregator.sol";


contract HelperConfig is Script{
    // If we are on a local chain, we will deploy the mock
    // otherwise grab the address from the others network

    NetWorkConfig public activeNetworkConfig;
    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8;

    struct NetWorkConfig{
        address priceFeed; // ETH/USD price feed address
    }

    constructor(){
        if (block.chainid == 11155111){
            activeNetworkConfig = getSepoliaEthConfig();
        }else if(block.chainid == 1){
            activeNetworkConfig = getMainnetEthConfig();
        }else{
            activeNetworkConfig = getOrCreateAvailEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns(NetWorkConfig memory){
        //price feed address
        NetWorkConfig memory sepoliaConfig = NetWorkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

    function getMainnetEthConfig() public pure returns(NetWorkConfig memory){
        //price feed address
        NetWorkConfig memory ethConfig = NetWorkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return ethConfig;
    }

    function getOrCreateAvailEthConfig() public returns(NetWorkConfig memory){
        
        if (activeNetworkConfig.priceFeed != address(0)){
            return activeNetworkConfig;
        }

      // 1 . Deploy the mock
      // 2. keep track of the contract address

      vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE);
      vm.stopBroadcast();

        NetWorkConfig memory availEthConfig = NetWorkConfig({
            priceFeed: address(mockPriceFeed)
        });
        return availEthConfig;
    }

}