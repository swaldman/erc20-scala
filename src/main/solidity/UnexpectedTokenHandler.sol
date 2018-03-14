pragma solidity ^0.4.18;

import "ERC20.sol";

contract UnexpectedTokenHandler {
   address public unexpectedTokenOwner; // only getters are autocreated

   mapping (address => uint8) public expectedTokens; // only getters are autocreated


   function markExpected( address tokenContract ) internal { 
      expectedTokens[ tokenContract ] = 1;
   }

   function UnexpectedTokenHandler( address _unexpectedTokenOwner ) public {
      unexpectedTokenOwner = _unexpectedTokenOwner;
   }

   modifier unexpectedTokenOwnerOnly {
     require ( msg.sender == unexpectedTokenOwner );
     _;
   }

   function withdrawUnexpectedToken( address tokenContract ) public unexpectedTokenOwnerOnly {
     require ( expectedTokens[ tokenContract ] == 0 ); // only allow withdrawals of unexpected tokens

     ERC20 token = ERC20( tokenContract );
     token.transfer( unexpectedTokenOwner, token.balanceOf(this) );
   }
}