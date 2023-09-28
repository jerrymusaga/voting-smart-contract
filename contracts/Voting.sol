// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting{
    address private owner;

    mapping(address => bool) private registeredVoters;
    mapping(address => bool) private hasVoted;

    enum VoteOption { Option1, Option2, Option3, Option4 }
    mapping(address => VoteOption) private voterChoices;
    uint256 private option1Votes;
    uint256 private option2Votes;
    uint256 private option3Votes;
    uint256 private option4Votes;

    event VoterRegistered(address voter);
    event Voted(address voter, VoteOption choice);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    modifier onlyVoter() {
        require(registeredVoters[msg.sender], "You are not a registered voter.");
        _;
    }

    modifier canVote() {
        require(!hasVoted[msg.sender], "You have already voted.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerVoter(address _voter) public onlyOwner {
        registeredVoters[_voter] = true;
        emit VoterRegistered(_voter);
    }

    function vote(VoteOption _choice) public onlyVoter canVote {
        voterChoices[msg.sender] = _choice;
        hasVoted[msg.sender] = true;
        if (_choice == VoteOption.Option1) {
            option1Votes++;
        } else if(_choice == VoteOption.Option2) {
            option2Votes++;
        }
        else if(_choice == VoteOption.Option3){
            option3Votes++;
        }
        else{
            option4Votes++;
        }
       
        emit Voted(msg.sender, _choice);
    }

    function getVoteResult() public view returns (uint256, uint256, uint256, uint256) {
        return (option1Votes, option2Votes, option3Votes, option4Votes);
    }
}
