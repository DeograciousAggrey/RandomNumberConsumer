
pragma solidity 0.6.6;

import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT WHICH USES HARDCODED VALUES FOR CLARITY.
 * PLEASE DO NOT USE THIS CODE IN PRODUCTION.
 */
contract RandomNumberConsumer is VRFConsumerBase {
   
    bytes32 internal keyHash;
    uint256 internal fee;
    
    uint256 public randomResult;
    
    /**
     * constructor inherits VRFConsumerBase 
     * 
     * Network: Rinkeby
     * chainlink vrf coordinator address: 0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B
     * LINK token address: 0x01BE23585060835E02B77ef475b0Cc51aA1e0709
     * key Hash: 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311
    */
    
    constructor()
        VRFConsumerBase(
            0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B, //VRF coordinator
            0x01BE23585060835E02B77ef475b0Cc51aA1e0709 //LINK token
            ) public 
        {
            keyHash = 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
            fee = 0.1 * 10 ** 18;
        }
    
    /**
     * Request Randomness
    */
   function getRandomNumber() public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
        return requestRandomness(keyHash, fee);
    }
    /**
     * callback function used by VRF coordinator
     */
     
     function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
         randomResult = randomness;
     }
    
    
     // function withdrawLink() external {} - Implement a withdraw function to avoid locking your LINK in the contract
    
}