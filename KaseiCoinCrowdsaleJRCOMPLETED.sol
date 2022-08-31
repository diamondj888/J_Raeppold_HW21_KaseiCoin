/*Hello Grader:  Please note I had trouble with the deployment phase of this HW despite a couple trys (and a brief look with tutor).
I was unable to fully complete the deployment phase, but conceptually I understand that the coin needs to be deployed first and then run thru 
with both crowdsales.  Hopefully I can figure this out after graduation - the code should be good, but I keep getting a weird squiggle/error 
indication on LINE 48 of Crowdsale and cannot seem to get rid of/properly compile in Remix.  Other than that, I think I figured most of it out
*/

pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale { // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
    // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
    constructor(
        // YOUR CODE HERE! JR CODE > 
        contstructor(
            uint256 rate,
            address payable wallet,
            KaseiCoin token
        
    ) public Crowdsale(rate, wallet, token) {
        // constructor can stay empty
    }
}


contract KaseiCoinCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address`.
    // YOUR CODE HERE! JR CODE > 
    address public kasei_token_address;
    // Create an `address public` variable called `kasei_crowdsale_address`.
    // YOUR CODE HERE! JR CODE > 
    address public kasei_crowdsale_address;

    // Add the constructor.
    constructor(
       // YOUR CODE HERE! JR CODE > 
       constructor(
        string memory name,
        string memory symbol,
        address payable wallet

       
    ) public {
        // Create a new instance of the KaseiCoin contract.
        // YOUR CODE HERE! JR CODE > 
        KaseiCoin token = new KaseiCoin(name, symbol, 0);
        
        // Assign the token contract’s address to the `kasei_token_address` variable.
        // YOUR CODE HERE! JR CODE > 
        kasei_token_address = address(token);

        // Create a new instance of the `KaseiCoinCrowdsale` contract
        // YOUR CODE HERE! JR CODE > 
        KaseiCoinCrowdsale kasei_crowdsale = new KaseiCoinCrowdsale(1, wallet, token);
            
        // Aassign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        // YOUR CODE HERE! JR CODE > 
        kasei_crowdsale_address = address(kasei_crowdsale); 

        // Set the `KaseiCoinCrowdsale` contract as a minter
        // YOUR CODE HERE! JR CODE > 
        token.addMinter(kasei_crowdsale);
        
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
        // YOUR CODE HERE! JR CODE > 
        token.renounceMinter();
    }
}
