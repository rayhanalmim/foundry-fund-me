// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import {Test, console} from "../lib/forge-std/src/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test{
    FundMe fundMe;
    function setUp() external {
        fundMe = new FundMe();
        
    }
    function testMinimumDollersFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }
    function testOwner() public view {
        console.log("Owner", fundMe.i_owner());
        console.log("Address", msg.sender);
        assertEq(fundMe.i_owner(), address(this));
    }
    
}