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
    
    function completeSadFlowLevel0 () public {
        bool result = stateMachineToTest.setState(3);
        Assert.equal(result, false, "Change to 3 is not possible");
        Assert.equal(stateMachineToTest.currentState(), 0, "Current state is 0");
    }
    
    function completeSadFlowLevel1 () public {
        bool result = stateMachineToTest.setState(1);
        Assert.equal(result, true, "Change to 1 is possible");
        Assert.equal(stateMachineToTest.currentState(), 1, "Current state is 1");
        
        result = stateMachineToTest.setState(4);
        Assert.equal(result, false, "Change to 4 is not possible");
        Assert.equal(stateMachineToTest.currentState(), 1, "Current state is 2");
    }
    
    function completeSadFlowLevel2 () public {
        bool result = stateMachineToTest.setState(1);
        Assert.equal(result, true, "Change to 1 is possible");
        Assert.equal(stateMachineToTest.currentState(), 1, "Current state is 1");
        
        result = stateMachineToTest.setState(2);
        Assert.equal(stateMachineToTest.currentState(), 2, "Current state is 2");
        
        result = stateMachineToTest.setState(3);
        Assert.equal(stateMachineToTest.currentState(), 2, "Current state is 2");
    }
}
