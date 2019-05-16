pragma solidity ^0.5.0;

import '../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import '../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';
import '../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract BaseGold is ERC721Full, ERC721Mintable, Ownable {
  constructor() ERC721Full() public {}
    uint256 traits; //combine these into an integer that can be decrypted into sections for real use
  
    uint64 birthTime;
    uint64 evolveTime;
    uint256 evolutionId;

    uint256 traitAppliedId;

    uint64 cooldownEndBlock;
    uint16 cooldownIndex;

    uint16 generation;

    mapping(uint256 => uint256) evolutionHistory; //evolutionId => traitAppliedId
    mapping(address => uint256) ownershipHistory; //previous owner address => evolutionID


}