   
   
   /* QUESTION NO: 1
    
   * In Solidity, developers often use the SafeMath library to mitigate the risks 
   * associated with arithmetic operations in smart contracts. Suppose you are 
   * working on a project that involves handling token balances and transactions. 
   * Discuss the significance of incorporating the SafeMath library and provide an 
   * example scenario where the absence of SafeMath could lead to vulnerabilities 
   * in a smart contract. Additionally, explain how the SafeMath library helps address 
   * these concerns and maintain the integrity of the contract. Can you outline the 
   * specific functionality of the add function in SafeMath and why it's essential 
   * for secure contract development?

    */

    /* IMPORTANT POINTS
   
   -- Revert on Overflow 
   -- Preventing Overflow and Underflow
   -- Security Best Practices
   --
   
   */


    // SPDX-License-Identifier: MIT
    pragma solidity ^0.6.12;

    library SafeMath {
        function add(uint256 a, uint256 b) public pure returns (uint256) {
            uint256 c = a + b;
            require(c >= a, "SafeMath: addition overflow");
            return c;
        }
    }

    contract AddContract {
        using SafeMath for uint256;

        function safeAdd(uint256 x, uint256 y) public pure returns (uint256) {
            return x.add(y);
        }
    }

    contract WithOutAdd {
        uint256 balance = 2**256 - 1; // Maximum representable uint256 value

        function safeAdd(uint256 x) public view returns (uint256) {
            // Vulnerable addition without SafeMath
            uint256 newBalance = balance + x;
                return balance;
            }
        
    }


   
