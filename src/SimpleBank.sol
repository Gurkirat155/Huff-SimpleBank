// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
// String was missing and constructor with dynamic input and payable was missing
contract SimpleBank {
    mapping(address => uint256) public balances;
    string public name;

    constructor (string memory yourName) {
        name = yourName;
    }

    function deposit() external payable {
        require(msg.value > 0, "Please send some Ether");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
