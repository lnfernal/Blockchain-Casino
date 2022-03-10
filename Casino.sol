//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

contract Casino{

    address internal Cedric = 0x7FCe897A5f3F2dfee5c0dBF10b1073f6613a5E3e;
    address internal Jack = 0x7FCe897A5f3F2dfee5c0dBF10b1073f6613a5E3e;

    struct Player {
        address playerAddress;
    }
    Player player = Player({playerAddress: 0x0000000000000000000000000000000000000000});
    int256 public Player_Funds = 0;
    address public Player_Address = player.playerAddress;

    function register(address _playerAddress) public {
        player = Player({playerAddress: _playerAddress});
        Player_Address = player.playerAddress;
    }

    function Slots(int256 bet) public{
        require(player.playerAddress != 0x0000000000000000000000000000000000000000);
        int256 payout;
        //code for slots
        payout = -1 * bet;
        Player_Funds = Player_Funds + payout;
    }

    function Roulette(int256 bet) public{
        require(player.playerAddress != 0x0000000000000000000000000000000000000000);
        int256 payout;
        //code for roulette
        payout = 1 * bet;
        Player_Funds = Player_Funds + payout;
    }

}