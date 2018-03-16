pragma solidity ^0.4.18;

import "https://github.com/OpenZeppelin/zeppelin-solidity/blob/c5d66183abcb63a90a2528b8333b2b17067629fc/contracts/token/ERC20/StandardToken.sol";

// modified from https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/examples/SimpleToken.sol
contract TestToken1 is StandardToken {
  string public constant name = "Test Token 1"; 
  string public constant symbol = "TT1"; 
  uint8 public constant decimals = 18; 

  uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

  function TestToken1() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    Transfer(0x0, msg.sender, INITIAL_SUPPLY);
  }
}

// modified from https://github.com/OpenZeppelin/zeppelin-solidity/blob/master/contracts/examples/SimpleToken.sol
contract TestToken2 is StandardToken {
  string public constant name = "Test Token 2"; 
  string public constant symbol = "TT2"; 
  uint8 public constant decimals = 18; 

  uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

  function TestToken2() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    Transfer(0x0, msg.sender, INITIAL_SUPPLY);
  }
}

