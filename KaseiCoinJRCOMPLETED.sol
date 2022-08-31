/*Hello Grader:  Please note I had trouble with the deployment phase of this HW despite a couple trys (and a brief look with tutor).
I was unable to fully complete the deployment phase, but conceptually I understand that the coin needs to be deployed first and then run thru 
with both crowdsales.  Hopefully I can figure this out after graduation - the code should be good, but I keep getting a weird squiggle/error 
indication on LINE 48 of Crowdsale and cannot seem to get rid of/properly compile in Remix.  Other than that, I think I figured most of it out
*/

pragma solidity ^0.5.0;

//  Import the following contracts from the OpenZeppelin library:
//    * `ERC20`
//    * `ERC20Detailed`
//    * `ERC20Mintable`
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

// Create a constructor for the KaseiCoin contract and have the contract inherit the libraries that you imported from OpenZeppelin.
// JR CODE > 

contract KaseiCoin is ERC20, ERC20Detailed, ERC20Mintable {
    constructor(
        string memory name,
        strin memory symbol,
        uint initial_supply
    )
        ERC20Detailed(name, symbol, 18)
        public
}