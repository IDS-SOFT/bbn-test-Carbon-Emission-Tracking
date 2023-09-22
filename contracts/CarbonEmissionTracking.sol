//SPDX-License-Identifier:GPL-3.0

pragma solidity ^0.8.0;

contract CarbonEmissionTracking {
    // Define variables
    address public owner;
    string public productName;
    string public productDescription;
    uint public productValue;

    // Define events
    event ProductCreated(address indexed user, string indexed productName, uint indexed productValue);
    event ProductUpdated(address indexed user, string indexed productName, uint indexed productValue);
    event ProductDeleted(address indexed user);

    // Constructor function
    constructor() {
        owner = msg.sender;
        productName = "";
        productDescription = "";
        productValue = 0;
    }

    // Function to create product
    function createProduct(string memory _productName, string memory _productDescription, uint _productValue) public {
        require(msg.sender == owner, "Only owner can create product");
        productName = _productName;
        productDescription = _productDescription;
        productValue = _productValue;
        emit ProductCreated(msg.sender, productName, productValue);
    }

    // Function to update product
    function updateProduct(string memory _productName, string memory _productDescription, uint _productValue) public {
        require(msg.sender == owner, "Only owner can update product");
        productName = _productName;
        productDescription = _productDescription;
        productValue = _productValue;
        emit ProductUpdated(msg.sender, productName, productValue);
    }

    // Function to delete product
    function deleteProduct() public {
        require(msg.sender == owner, "Only owner can delete product");
        productName = "";
        productDescription = "";
        productValue = 0;
        emit ProductDeleted(msg.sender);
    }
}
