// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../contracts/EthereumStateMachine.sol";

contract EthereumStateMachineTest {
   
    uint[][] public states;
   
    EthereumStateMachine stateMachineToTest;
    function beforeEach () public {
        states = [
            [0, 1, 0, 0],
            [0, 0, 1, 1],
            [0, 0, 0, 0],
            [1, 0, 0, 0]
        ];
        
        stateMachineToTest = new EthereumStateMachine(states);
    }
    
    function correctInit () public {
        Assert.equal(stateMachineToTest.currentState(), uint(0), "Initial state must be 0");
    }
    
    function completeHappyFlow () public {
        bool result = stateMachineToTest.setState(1);
        Assert.equal(result, true, "Change to 1 is possible");
        Assert.equal(stateMachineToTest.currentState(), 1, "Current state is 1");
        
        result = stateMachineToTest.setState(2);
        Assert.equal(stateMachineToTest.currentState(), 2, "Current state is 2");
    }
    
    function completeLongHappyFlow () public {
        bool result = stateMachineToTest.setState(1);
        Assert.equal(result, true, "Change to 1 is possible");
        Assert.equal(stateMachineToTest.currentState(), 1, "Current state is 1");
        
        result = stateMachineToTest.setState(3);
        Assert.equal(stateMachineToTest.currentState(), 3, "Current state is 3");
        
        result = stateMachineToTest.setState(0);
        Assert.equal(stateMachineToTest.currentState(), 0, "Current state is 0");
        
        result = stateMachineToTest.setState(1);
        Assert.equal(stateMachineToTest.currentState(), 1, "Current state is 1");
        
        result = stateMachineToTest.setState(2);
        Assert.equal(stateMachineToTest.currentState(), 2, "Current state is 2");
    }
}
