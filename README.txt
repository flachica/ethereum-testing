State machine as proof of concept

To create the contract, a two-dimensional array must be passed. 

Each position of the first dimension corresponds to a state. 
Each position of the second dimension will correspond to the following possible states through which the state machine can pass. It can be pass if result is greater than 0.

1. 'contracts': Holds three contracts with different complexity level, denoted with number prefix in file name.
2. 'scripts': Holds two scripts to deploy a contract. It is explained below.
3. 'tests': Contains two test files. One with the happy flow (all change of state is possible). The other has change of state that can't be applied