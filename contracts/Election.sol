pragma solidity ^0.7.0;

contract Election {
    
    
    struct Candidate{
        uint id;
        string name;
        uint votecount;
    }
    
    uint public candidatesCount;
    
    mapping(uint => Candidate) public candidates;
    
    mapping(address => bool) public votedornot;
    
    event ElectionUpdated(uint id, string name, uint votecount);
    
    constructor() {
        addCandidate("Donald Trump");
        addCandidate("Barack Obama");
    }
    
    function addCandidate(string memory name) private   {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, name, 0);
    }
    
    function Vote(uint _id) public {
        require(!votedornot[msg.sender], "You have already voted!!");
        require(candidates[_id].id != 0, "The candidate doesn't exist. Dun Dun DUNN!!!");
        
        candidates[_id].votecount += 1;
        votedornot[msg.sender] = true;
        emit ElectionUpdated (_id, candidates[_id].name, candidates[_id].votecount);
    }
    
    
    
}