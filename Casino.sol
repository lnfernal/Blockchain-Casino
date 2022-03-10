//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

contract Casino{

    address internal Cedric = 0x7FCe897A5f3F2dfee5c0dBF10b1073f6613a5E3e;
    address internal Jack = 0xf667Eb467304D505B9fD484Aa622B9213c1B8920;

    //Struct to hold player information
    struct Player {
        address playerAddress;
    }

    //Struct to hold game information
    struct Game {
        string gameLink;
    }

    //Struct to hold seller information
    struct Seller{
        address sellerAddress;
    }

    //mapping seller's address to an array of games in games
    mapping(address => uint256) private addressToGamesID;

    //array of players 
    Player [] public players;
    //array of sellers
    Seller [] public sellers;
    //array of array of games
    Game [][] public games;

    //sets player address
    function registerPlayer(address _playerAddress) public {
        players.push(Player(_playerAddress));
    }

    //sets seller address, 
    //creates a new array of games in games initalized with _gameLink, 
    //mapps seller address to a index in games
    function registerSeller(address _sellerAddress, string memory _gameLink) public {
        sellers.push(Seller(_sellerAddress));
        games[games.length + 1].push(Game(_gameLink));
        addressToGamesID[_sellerAddress] = games.length;
        //need to add an inital deposit to add a game
    }

    //adds a new game to the seller's array of games
    function sellerAddGame(address _sellerAddress, string memory _gameLink) public {
        uint256 gamesID = addressToGamesID[_sellerAddress];
        games[gamesID].push(Game(_gameLink));
    }

    function playerBet(uint256 bet) public{
        //IDK
    }

    function playerPayout(int256 payout) private {
        //IDK
    }
}
