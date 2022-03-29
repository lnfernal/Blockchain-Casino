//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

contract LuckyBlue {
    address payable public cedric;
    address payable public jack;
    address payable[] public players;
    Vendor[] public vendors;
    uint256 numGames;

    struct Vendor {
        address payable vendorAddress;
        uint256 numVendorGames;
    }

    constructor() public {}

    // Registers a player
    function RegisterPlayer() public payable {
        uint256 playerFee = 10;
        uint256 vendorCut = playerFee / 2;
        uint256 ownerCut = playerFee / 2;
        require(msg.value >= playerFee, "Not enough Blue Coin!"); //pay fee
        require(CheckPlayer(msg.sender) == false, "You are already a player");
        players.push(payable(msg.sender)); //added to list
        PayVendors(uint256(vendorCut)); //sends cut to vendors
        PayOwners(uint256(ownerCut)); //sends cut to owners
    }

    // Deregisters a player
    function DeregisterPlayer() public {
        require(CheckPlayer(msg.sender) == true, "You are not a player");
        for (uint256 i = 0; i < players.length; i++) {
            if (players[i] == msg.sender) {
                players[i] = players[players.length - 1];
                players.pop();
                return;
            }
        }
    }

    // Registers a Vendor
    function RegisterVendor() public payable {
        uint256 vendorFee = 10;
        require(msg.value >= vendorFee, "Not enough Blue Coin!"); //takes inital game and payment
        require(CheckVendor(msg.sender) == false, "You are already a vendor");
        vendors.push(Vendor({vendorAddress: msg.sender, numVendorGames: 0})); //added to list
        PayOwners(vendorFee); //sends cut to vendors
    }

    // Deregisters a Vendor
    function DeregisterVendor() public {
        require(CheckVendor(msg.sender) == true, "You are not a vendor");
        for (uint256 i = 0; i < vendors.length; i++) {
            if (vendors[i].vendorAddress == msg.sender) {
                vendors[i] = vendors[vendors.length - 1];
                vendors.pop();
                return;
            }
        }
    }

    // Checks if a player is registered
    function CheckPlayer(address payable player) public view returns (bool) {
        for (uint256 i = 0; i < players.length; i++) {
            if (players[i] == player) return true;
        }
        return false;
    }

    // Checks if a vendor is registered
    function CheckVendor(address payable vendor) public view returns (bool) {
        for (uint256 i = 0; i < vendors.length; i++) {
            if (vendors[i].vendorAddress == vendor) return true;
        }
        return false;
    }

    //pays vendors thier cut
    function PayVendors(uint256 vendorCut) internal {
        uint256 payPerGame = vendorCut / numGames;
        for (uint256 i = 0; i < vendors.length; i++) {
            vendors[i].vendorAddress.transfer(
                (payPerGame * vendors[i].numVendorGames)
            );
        }
    }

    //pays owners thier cut
    function PayOwners(uint256 ownerCut) internal {
        uint256 owernPayment = ownerCut / 2;
        cedric.transfer(owernPayment);
        jack.transfer(owernPayment);
    }

    //adds a game to from a vendor
    function AddGame() public payable {
        require(msg.value >= 5, "Not enough Blue Coin!");
        require(CheckVendor(msg.sender) == true, "Not a registered vendor");
        numGames = numGames + 1;
        for (uint256 i = 0; i < vendors.length; i++) {
            if (vendors[i].vendorAddress == msg.sender) {
                vendors[i].numVendorGames = vendors[i].numVendorGames + 1;
            }
        }
    }
}
