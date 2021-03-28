// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@OpenZeppelin/contracts/token/ERC20/ERC20.sol';

contract TokenOpenZeppelin1 is ERC20 {
    constructor() ERC20('Li Coin', "LIC") public {}
}

//with allocation in constructor
contract TokenOpenZeppelin2 is ERC20 {
    constructor() ERC20("Li Coin", "LIC") {
        _mint(msg.sender, 10000);
    }
}

//with allocation in mint() function

contract TokenOpenZeppelin3 is ERC20 {
    address public admin;
    
    constructor() ERC20("Li Coin", "LIC") {
        admin = msg.sender;
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, 'only admin');
        _mint(to, amount);
    }
}

//with faucet
contract OpenZeppelin4 is ERC20 {
    constructor() ERC20("Li Coin", "LIC") {
    }

    function faucet(address to, uint amount) external{
        _mint(to, amount);
    }
}
