// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
import "erc721a/contracts/ERC721A.sol";
contract CU_ETH is ERC721A{

    address public owner;

    uint256 public maxQuantity = 5;
    string baseUrl = "https://gateway.pinata.cloud/ipfs/QmduCGzLZefuuupKvNAHDq2vJQEdiHmJ96pw1s8XCRW8RP/";    //url for nfts

    string public prompt =
        "Portrait of a young woman gardener wearing overall.";

    constructor() ERC721A("CU", "CU_coin") {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "restricted tot he owner only");
        _;
    }

    // minting NFT 
    function mint(uint256 quantity) external payable onlyOwner{
        require(totalSupply() + quantity <= maxQuantity ,"max limit is of 5");
        _mint(msg.sender, quantity);
    }
function promptDescription() external view returns (string memory) {
        return prompt;
    }
    function _baseURI() internal view override returns (string memory){
        return baseUrl;
    }

    
}
