pragma solidity ^0.4.18;

contract IBareERC20 {
  function totalSupply() public constant returns (uint);
  function balanceOf(address tokenOwner) public constant returns (uint balance);
  function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
  function transfer(address to, uint tokens) public returns (bool success);
  function approve(address spender, uint tokens) public returns (bool success);
  function transferFrom(address from, address to, uint tokens) public returns (bool success);
 
  event Transfer(address indexed from, address indexed to, uint tokens);
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract IERC20 is IBareERC20 {
  function name() public constant returns (string);
  function symbol() public constant returns (string);
  function decimals() public constant returns (uint8);
}

/*
 *  should never be deployed!
 *  exists as a concrete implementation only to force ABI and stub generation!
 */
contract BareERC20 is IBareERC20 {
  function totalSupply() public constant returns (uint)                                            { revert(); }
  function balanceOf(address tokenOwner) public constant returns (uint balance)                    { revert(); }
  function allowance(address tokenOwner, address spender) public constant returns (uint remaining) { revert(); }
  function transfer(address to, uint tokens) public returns (bool success)                         { revert(); }
  function approve(address spender, uint tokens) public returns (bool success)                     { revert(); }
  function transferFrom(address from, address to, uint tokens) public returns (bool success)       { revert(); }
}

/*
 *  should never be deployed!
 *  exists as a concrete implementation only to force ABI and stub generation!
 */
contract ERC20 is BareERC20 {
  function name() public constant returns (string)    { revert(); }
  function symbol() public constant returns (string)  { revert(); }
  function decimals() public constant returns (uint8) { revert(); }
}