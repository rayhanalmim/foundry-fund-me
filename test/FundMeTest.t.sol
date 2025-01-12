// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import {Test, console} from "../lib/forge-std/src/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test{
    FundMe fundMe;
    address USER = makeAddr("USER");
    uint256 public constant SEND_VALUE = 0.1 ether;
    uint256 public constant STARTING_USER_BALANCE = 10 ether;


    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_USER_BALANCE);
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

    function testFundFailsWithoutEnoughETH() public {
        vm.expectRevert();
        fundMe.fund();
    }

    function testFundSuccessWithEnoughETH() public {
        vm.prank(USER);
        fundMe.fund{value: SEND_VALUE}();
        uint256 amountFunded = fundMe.getAddressToAmountFunded(USER);
        assertEq(amountFunded, SEND_VALUE);
    }
}