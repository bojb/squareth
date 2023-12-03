// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// import "@nomicfoundation/hardhat-toolbox-viem";

contract SuperbowlSquare is ERC721, Ownable {
    struct Square {
        uint256 game_id;
        uint8 x;
        uint8 y;
    }

    Square[] public squares;

    constructor() ERC721("SuperbowlSquare", "SBS") {}

    function mintSquare(uint256 gameId, uint8 x, uint8 y) public onlyOwner {
      require(x < 10 && y < 10, "Coordinates out of range");

      squares.push(Square(gameId, x, y));
      uint256 newSquareId = squares.length - 1;

      _mint(msg.sender, newSquareId);
    }

    function getSquare(uint256 squareId) public view returns (uint256, uint8, uint8) {
      require(squareId, < squares.length, "Square does not exist");

      Square memory square = squares[squareId];
      return (square.gameId, square.x, square.y);
    }
}
