// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract StringPermutations {
    event PermutationGenerated(string permutation);
    
    function generatePermutations(string memory str) external {
        bytes memory chars = bytes(str);
        uint256 length = chars.length;
        uint256[] memory indexes = new uint256[](length);
        
        // Initialize indexes array
        for (uint256 i = 0; i < length; i++) {
            indexes[i] = 0;
        }
        
        emitPermutation(chars);
        
        uint256 i = 0;
        while (i < length) {
            if (indexes[i] < i) {
                if (i % 2 == 0) {
                    swap(chars, 0, i);
                } else {
                    swap(chars, indexes[i], i);
                }
                
                emitPermutation(chars);
                indexes[i]++;
                i = 0;
            } else {
                indexes[i] = 0;
                i++;
            }
        }
    }
    
    function emitPermutation(bytes memory chars) private pure {
        emit PermutationGenerated(string(chars));
    }
    
    function swap(bytes memory chars, uint256 i, uint256 j) private pure {
        bytes1 temp = chars[i];
        chars[i] = chars[j];
        chars[j] = temp;
    }
}
