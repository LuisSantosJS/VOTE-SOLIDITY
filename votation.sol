// SPDX-License-Identifier: MIT
//sistema de votação

pragma solidity ^0.8.0;


contract Votation {
    struct Result {
        uint bolsonaro;
        uint lula;
        uint moro;
    }
    mapping(string => bool) candidatesNames;
    mapping(address => bool) usersVoted;
    mapping(string => uint)  result;

    constructor (){
        candidatesNames["bolsonaro"] = true;
        candidatesNames["lula"] = true;
        candidatesNames["moro"] = true;
    }


    function showResult() public view returns(Result memory){
        return Result(
            result["bolsonaro"],
            result["lula"],
            result["moro"]
        );
    }

    function vote(string memory _candidate  ) public returns(string memory){
        require(candidatesNames[_candidate]);
        require(!usersVoted[msg.sender]);
        usersVoted[msg.sender] = true;
        result[_candidate] += 1;
        return "voted";
    }




}