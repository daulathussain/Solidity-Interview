// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentSplitter {

    function splitPayment(address[] memory recipients, uint[] memory shares) public payable {
        require(recipients.length == shares.length, "Recipients and shares length mismatch");
        require(msg.value > 0, "No Ether sent");

        uint totalShares = 0;
        
        // Calculate total shares to ensure it sums up to 100 (or 10000 for precision)
        for (uint i = 0; i < shares.length; i++) {
            totalShares += shares[i];
        }
        
        require(totalShares == 100, "Total shares must equal 100");

        // Distribute the funds based on the shares
        for (uint i = 0; i < recipients.length; i++) {
            uint payment = (msg.value * shares[i]) / 100;
            (bool success, ) = recipients[i].call{value: payment}("");
            require(success, "Payment failed");
        }
    }
}

//0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
//0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
//0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB