// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Staking {

    IERC20 public stakingToken;
    uint private _totalSupply;

    mapping(address => uint) private _balances;

    constructor(address _stakingToken) {
        stakingToken = IERC20(_stakingToken);
    }

    function stake(uint _amount) external {
        _totalSupply += _amount;
        _balances[msg.sender] += _amount;
        stakingToken.transferFrom(msg.sender, address(this), _amount);
    }

    function withdraw(uint _amount) external {
        _totalSupply -= _amount;
        _balances[msg.sender] -= _amount;
        stakingToken.transfer(msg.sender, _amount);
    }  
}

// interface IERC20 {
//     function totalSupply() external view returns (uint);

//     function balanceOf(address account) external view returns (uint);

//     function transfer(address recipient, uint amount) external returns (bool);

//     function allowance(address owner, address spender) external view returns (uint);

//     function approve(address spender, uint amount) external returns (bool);

//     function transferFrom(
//         address sender,
//         address recipient,
//         uint amount
//     ) external returns (bool);

//     event Transfer(address indexed from, address indexed to, uint value);
//     event Approval(address indexed owner, address indexed spender, uint value);
// }