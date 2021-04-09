// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title Ethereum State Machine
 * @dev Implement a very basic state machine
 */
contract EthereumStateMachine {
    uint[][] public states;
    address creator;
    uint public currentState;
    
    constructor (uint[][] memory _states) {
        states = _states;
        creator = msg.sender;
        currentState = 0;
    }
    
    function setState (uint state) public returns (bool) {
        bool result;
        if (currentState == state || states.length <= state) {
            result = false;
        } else {
            result = states[currentState][state] > 0;
        }
        if (result) {
            currentState = state;
        }
        return result;
        
    }
}
