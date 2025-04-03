// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract MedicationTracker {
    
    struct Medication {
        uint id;          
        string name;     
        address owner;   
    }
    
    uint public medCount = 0;
    mapping(uint => Medication) public meds;
    
    event MedCreated(uint id, string name, address owner);
    
    event MedTransferred(uint id, address newOwner);
    
    function addMed(string memory name) public {
        medCount++;
        meds[medCount] = Medication(medCount, name, msg.sender);
        emit MedCreated(medCount, name, msg.sender);
    }
    
    function transferMed(uint id, address newOwner) public {
        require(meds[id].owner == msg.sender, "Not the owner");
        meds[id].owner = newOwner;
        emit MedTransferred(id, newOwner);
    }
}
