// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Simple smart contract to track medications
contract MedicationTracker {
    
    // Structure to store medication details
    struct Medication {
        uint id;          // Unique identifier for the medication
        string name;      // Name of the medication
        address owner;    // Current owner of the medication
    }
    
    uint public medCount = 0; // Counter to track number of medications
    mapping(uint => Medication) public meds; // Mapping to store medications by their ID
    
    // Event to notify when a new medication is added
    event MedCreated(uint id, string name, address owner);
    
    // Event to notify when medication ownership is transferred
    event MedTransferred(uint id, address newOwner);
    
    // Function to add a new medication to the system
    function addMed(string memory name) public {
        medCount++; // Increment the medication count
        meds[medCount] = Medication(medCount, name, msg.sender); // Store medication details
        emit MedCreated(medCount, name, msg.sender); // Emit event for medication creation
    }
    
    // Function to transfer medication ownership
    function transferMed(uint id, address newOwner) public {
        require(meds[id].owner == msg.sender, "Not the owner"); // Ensure only the owner can transfer
        meds[id].owner = newOwner; // Update the owner of the medication
        emit MedTransferred(id, newOwner); // Emit event for ownership transfer
    }
}
