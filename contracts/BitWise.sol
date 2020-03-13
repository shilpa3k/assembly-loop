pragma solidity ^0.5.0;

contract BitWise {
    // count the number of bit set in data.  i.e. data = 7, result = 3
    function countBitSet(uint8 data) public pure returns (uint8 result) {
        for (uint256 i = 0; i < 8; i += 1) {
            if (((data >> i) & 1) == 1) {
                result += 1;
            }
        }
    }

    function countBitSetAsm(uint8 data) public pure returns (uint8 result) {
        // replace this with inline assembly code
        assembly {
            for {
                let i := 0
            } lt(i, 8) {
                i := add(i, 1)
            } {
                if and(shr(i, data), 1) {
                    result := add(result, 1)
                }
            }
        }

    }
}

// 5 ==> 0x0101
// i = 0: 0x0101 i =1 : 0x0010
//     &

// i = 7: 0x0000

