# RandomNumberConsumer
Random Number Consumer
Chainlink VRF follows the Request & Receive Data cycle. To consume randomness, your contract should inherit from VRFConsumerBase and define two required functions

requestRandomness, which makes the initial request for randomness.
fulfillRandomness, which is the function that receives and does something with verified randomness.
The contract should own enough LINK to pay the specified fee. The beginner walkthrough explains how to fund your contract.

Note, the below values have to be configured correctly for VRF requests to work. You can find the respective values for your network in the VRF Contracts page.

LINK Token - LINK token address on the corresponding network (Ethereum, Polygon, BSC, etc)
VRF Coordinator - address of the Chainlink VRF Coordinator
Key Hash - public key against which randomness is generated
Fee - fee required to fulfill a VRF request
