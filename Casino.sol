//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

contract Casino{

    address internal Cedric = 0x7FCe897A5f3F2dfee5c0dBF10b1073f6613a5E3e;
    address internal Jack = 0x7FCe897A5f3F2dfee5c0dBF10b1073f6613a5E3e;

    struct Player {
        address playerAddress;
    }
    int256 public playerFunds = 0;

    Player player = Player({playerAddress: 0x7FCe897A5f3F2dfee5c0dBF10b1073f6613a5E3e});

    function register(address _playerAddress) public pure {
        Player({playerAddress: _playerAddress});
    }

    function Slots() public{
        int256 payout;
        //code for slots
        payout = -1;
        playerFunds = playerFunds + payout;
    }

    function Roulette() public{
        int256 payout;
        //code for roulette
        payout = 1;
        playerFunds = playerFunds + payout;
    }

}