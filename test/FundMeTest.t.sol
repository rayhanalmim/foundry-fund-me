// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import {Test, console} from "../lib/forge-std/src/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test{
    FundMe fundMe;
    function setUp() external {
        // fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        
    }
    function testMinimumDollersFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }
    function testOwner() public view {
        assertEq(fundMe.i_owner(), msg.sender);
    }
    function testPriceVersionInAccurate() public view {
        uint256 version = fundMe.getVersion();
        console.log("Version", version);
        assertEq(version, 4);
    }
}