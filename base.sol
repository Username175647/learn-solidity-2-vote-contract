//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Election {

    string[] public electors;
    uint256 public maxVotes;
    uint256 public electionEndTime;
    address public contractOwner;

    mapping(address => bool) public userVotes;
    mapping(uint256 => uint256) public votesCount;
    error YourAddressCantVote();
    error ElectorDoesNotExist(uint256 _pickedElector, uint256 _totalElectors);

    //["Alex","Kostya","Micke"]

    constructor(string[] memory _electors, uint256 _maxVotes, uint256 _electionTime) {
        electors = _electors;
        maxVotes = _maxVotes;
        electionEndTime = block.timestamp + _electionTime;
        contractOwner = msg.sender;
    }
    function vote(uint256 _numberOfElector) public {
        require(userVotes[msg.sender] == false, YourAddressCantVote());
        require(_numberOfElector < electors.length, ElectorDoesNotExist(_numberOfElector, electors.length));
        require(votesCount[_numberOfElector] <= maxVotes - 1, "Max Votes");
        require(msg.sender != contractOwner, "Contract owner can't vote");
        require(block.timestamp < electionEndTime, "Voting is over");
        userVotes[msg.sender] = true;
        votesCount[_numberOfElector] += 1;
    }

}

