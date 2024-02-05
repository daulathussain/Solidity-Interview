


/* SOLIDITY QUESTION NO: 5

    Why is the mod function in the SafeMath library important for smart 
    contract development in Solidity? How does it address risks associated 
    with modulo operations, specifically concerning division by zero 
    vulnerabilities? Explain the significance of the error message 
    "SafeMath: modulo by zero" within the mod function and its role in 
    enhancing contract security. Provide a brief hypothetical scenario 
    illustrating the potential vulnerabilities in modulo operations without 
    SafeMath, and discuss how the mod function mitigates these risks?
*/

    // SPDX-License-Identifier: MIT
    pragma solidity ^0.6.12;

    library SafeMath {
        function mod(uint256 a, uint256 b) public pure returns (uint256) {
            return mod(a, b, "SafeMath: modulo by zero");
        }

        function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
            require(b > 0, errorMessage);
            uint256 c = a % b;
            return c;
        }
    }

    contract ExampleContract {
        using SafeMath for uint256;

        function safeMod(uint256 x, uint256 y) public pure returns (uint256) {
            return x.mod(y);
        }
    }

//PART 2
    library UnsafeMath {
        function unsafeMod(uint256 a, uint256 b) public pure returns (uint256) {
            uint256 c = a % b;
            return c;
        }
    }

    contract VulnerableContract {
        using UnsafeMath for uint256;

        function calculateRemainder(uint256 value, uint256 divisor) public pure returns (uint256) {
            // Unsafe modulo operation without SafeMath
            return value.unsafeMod(divisor);
        }
    }

    //PART 3

    contract calculateRemainderContract {
        using UnsafeMath for uint256;

        function calculateRemainder(uint256 value, uint256 divisor) public pure returns (uint256) {
            // Unsafe modulo operation without SafeMath
            return value.unsafeMod(divisor);
        }

        function exampleUsage() public pure {
            uint256 x = 42;
            uint256 y = 0;

            // This modulo operation will result in a modulo by zero error
            uint256 result = calculateRemainder(x, y);
        }
    }
