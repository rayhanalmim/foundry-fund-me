// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;
import {Script} from "../lib/forge-std/src/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        //before tx: its not a real tx, its a simulation
        HelperConfig helperConfig = new HelperConfig();
        address ethPriceFeed = helperConfig.activeNetworkConfig();

        //during broadcast: its a real tx
        vm.startBroadcast();
        FundMe fundme = new FundMe(ethPriceFeed);
        
        vm.stopBroadcast();
        return fundme;
    }
}