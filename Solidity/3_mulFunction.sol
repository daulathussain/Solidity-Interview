
   
   
   /* QUESTION NO: 3
    
   In the context of Solidity and smart contract development, the SafeMath 
   library includes a function named mul designed for secure multiplication 
   of unsigned integers (uint256). Explain the purpose and significance of 
   using the mul function in SafeMath. What risks does it address, particularly 
   related to arithmetic overflow, and how does it contribute to the overall 
   security of smart contracts? Provide an example scenario where the absence 
   of SafeMath in multiplication operations could lead to vulnerabilities, and 
   elaborate on how the mul function helps mitigate such risks.
    */

       /* IMPORTANT POINTS
   
   -- Safe Multiplication 
   -- Handling Zero Input: (a == 0)
   -- Overflow Check
   -- Revert on Overflow
   
   */

    /* PART 1 */

    // SPDX-License-Identifier: MIT
    pragma solidity ^0.6.12;

    library SafeMath {
        function mul(uint256 a, uint256 b) public pure returns (uint256) {
            if (a == 0) {
                return 0;
            }
            uint256 c = a * b;
            require(c / a == b, "SafeMath: multiplication overflow");
            return c;
        }
    }

    contract MultiplyContract {
        using SafeMath for uint256;

        function safeMul(uint256 x, uint256 y) public pure returns (uint256) {
            return x.mul(y);
        }
    }

  /* PART 2 */

    library UnsafeMath {
        function unsafeMul(uint256 a, uint256 b) public pure returns (uint256) {
            uint256 c = a * b;
            return c;
        }
    }


    contract WithoutMultiply {
        using UnsafeMath for uint256;

        function vulnerableOperation(uint256 x, uint256 y) public pure returns (uint256) {
            // Unsafe multiplication without SafeMath
            return x.unsafeMul(y);
        }
        
        function exampleUsage() public  view returns (uint256){
            uint256 a = 2**255;  // A large value
            uint256 b = 3;

            // This multiplication will result in an overflow
            uint256 result = a * b;
            return result;
        }
    }


 
