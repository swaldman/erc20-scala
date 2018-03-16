pragma solidity ^0.4.18;

import "ERC20.sol";

contract UnexpectedTokenHandler {
   address public unexpectedTokenOwner; // only getter is autocreated

   mapping (address => uint8) private expectedTokens;

   /*
    * this should be called as many times as necessary in the
    * constructor of inheriting contracts.
    */
   function markExpectedToken( address tokenContract ) internal { 
      expectedTokens[ tokenContract ] = 1;
   }

   function isExpectedToken( address tokenContract ) public returns ( bool ) {
      return expectedTokens[ tokenContract ] != 0;
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