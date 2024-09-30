//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SimpleCryptoKitties is ERC721{
       uint256 public _tokenIdCounter = 1;
    
    struct Kitty{
         uint256 momId;
         uint256 dadId;
         uint256 genes;
         uint256 generation;
         uint256 birthtime;
    }

     mapping(uint256 => Kitty) public kitties;
     
     constructor() ERC721("SimpleCryptoKitties","SCK"){} 
     
     function createKittyGen0() public returns(uint256){
         
           uint256 genes = uint256(keccak256(abi.encodePacked(block.timestamp, _tokenIdCounter)));
           
           return _createKitty(0,0,genes,0,msg.sender);
     }
     
     
     
     function _createKitty(
           uint256 momId, 
           uint256 dadId, 
           uint256 genes,
           uint256 generation,
           address owner
      ) private returns(uint256){
            kitties[_tokenIdCounter] = Kitty(
                   momId,
                   dadId,
                   genes,
                   generation,
                   block.timestamp
            );
             
             _mint(owner,_tokenIdCounter);

           
           return _tokenIdCounter++;
      }

      function breed(uint256 momId,uint256 dadId) public returns(uint256){
           Kitty memory mom = kitties[momId];
           Kitty memory dad = kitties[dadId];
           
           require(ownerOf(momId) == msg.sender,"Not the owner of the mom kitty");
           require(ownerOf(dadId) == msg.sender,"Not the owner of the dad kitty");
           
           uint256 newGenes =mom.genes / 2 + dad.genes /2; 
           
           uint256 newGeneration = ((mom.generation > dad.generation ? mom.generation : dad.generation))+1;
           
            return _createKitty(momId, dadId, newGeneration, newGenes, msg.sender);


      }

 }