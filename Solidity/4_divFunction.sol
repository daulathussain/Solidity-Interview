   
   
   /* QUESTION NO: 4
    
   In Solidity, the SafeMath library provides functions to perform arithmetic 
   operations securely in smart contracts. One such function is div, designed 
   for safe division of unsigned integers (uint256). Explain the significance 
   of using the div function in SafeMath. What risks does it address, particularly 
   in terms of division by zero vulnerabilities? Describe the purpose of the 
   error message "SafeMath: division by zero" within the div function, and how 
   does it contribute to the overall security of smart contracts? Provide an 
   example scenario where the absence of SafeMath in division operations could 
   lead to vulnerabilities, and explain how the div function helps mitigate such risks

    */

       /* IMPORTANT POINTS
   
   -- Preventing Division by Zero 
   -- Consistency with SafeMath Principles
   -- Secure Contract Development
   
   */

   // SPDX-License-Identifier: MIT
    pragma solidity ^0.6.12;

    library SafeMath {
        function div(uint256 a, uint256 b) public pure returns (uint256) {
            return div(a, b, "SafeMath: division by zero");
        }

        function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
            require(b > 0, errorMessage);
            uint256 c = a / b;
            return c;
        }
    }

    contract ExampleContract {
        using SafeMath for uint256;

        function safeDiv(uint256 x, uint256 y) public pure returns (uint256) {
            return x.div(y);
        }
    }

       /* ERROR EXAMPLE */


        contract VulnerableContract {

            function exampleUsage() public view returns (uint256) {
                uint256 a = 42;
                uint256 b = 0;

                // This division will result in a division by zero error
                uint256 result = a / b;
                return result;
            }
        }
