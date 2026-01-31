//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Election {

    string[] public electors;
    uint256 public maxVotes;
    uint256 public electionTime;
    address public contractOwner;

    mapping(address => bool) public userVotes;
    mapping(uint256 => uint256) public votesCount;

    constructor(string[] memory _electors, uint256 _maxVotes, uint256 _electionTime) {
        electors = _electors;
        maxVotes = _maxVotes;
        electionTime = _electionTime;
        contractOwner = msg.sender;
    }
    function vote(uint256 _numberOfElector) public {
        require(userVotes[msg.sender] == false, "Your address can't vote");
        require(_numberOfElector < electors.length, "Elector does not exist");
        require(votesCount[_numberOfElector] <= maxVotes - 1, "Max Votes");
        require(msg.sender != contractOwner, "Contract owner can't vote");
        userVotes[msg.sender] = true;
        votesCount[_numberOfElector] += 1;
    }

}

