//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Election {

    string[] public electors;
    uint256 public maxVotes;
    uint256 public electionTime;

    mapping(address => uint256) public userVotes;
    mapping(uint256 => uint256) public votesCount;

    constructor(string[] memory _electors, uint256 _maxVotes, uint256 _electionTime) {
        electors = _electors;
        maxVotes = _maxVotes;
        electionTime = _electionTime;
    }
    function vote(uint256 _numberOfElector) public {
        userVotes[msg.sender] = _numberOfElector;
        votesCount[_numberOfElector] += 1;
    }

}