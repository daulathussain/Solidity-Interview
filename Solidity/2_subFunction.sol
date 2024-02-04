
   
   
   /* QUESTION NO: 2
    
   SafeMath is a commonly used library in Solidity to prevent vulnerabilities 
   associated with arithmetic operations in smart contracts. In the context of 
   SafeMath, discuss the significance of the sub function and its role in secure 
   contract development. Why is it crucial to use sub when performing subtraction 
   operations with unsigned integers (uint256)? Additionally, explain the purpose 
   of the error message "SafeMath: subtraction overflow" and how it contributes 
   to contract security. Can you provide an example scenario where the absence 
   of SafeMath in subtraction operations could lead to vulnerabilities in a smart contract?
    */

     /* IMPORTANT POINTS
   
   -- safe Subtraction 
   -- Error Message on Underflow
   -- Revert on Underflow
   -- Consistency with SafeMath Principles
   -- Secure Contract Development
   
   */

    // SPDX-License-Identifier: MIT
    pragma solidity ^0.6.12;

    library SafeMath {
        function sub(uint256 a, uint256 b) public pure returns (uint256) {
            return sub(a, b, "SafeMath: subtraction overflow");
        }

        function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
            require(b <= a, errorMessage);
            uint256 c = a - b;
            return c;
        }
    }

    contract SubContract {
        using SafeMath for uint256;

        function safeSub(uint256 x, uint256 y) public pure returns (uint256) {
            return x.sub(y);
        }
    }

     contract WithOutSub {
        uint256 balance = 100; // Initial token balance

        function safeSub(uint256 x) public view returns (uint256) {
             // Vulnerable subtraction without SafeMath
             uint256 newBalance = balance - x;
            return newBalance;
        }
    }

 
