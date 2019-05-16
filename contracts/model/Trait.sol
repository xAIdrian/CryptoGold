pragma solidity ^0.5.0;

import '../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import '../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';
import '../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract Trait is ERC721Full, ERC721Mintable, Ownable {
  constructor() ERC721Full() public {}
}