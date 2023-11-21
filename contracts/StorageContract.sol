// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract StorageContract {
    // Structure pour stocker les données associées à chaque compte
    struct UserData {
        address account;
        uint256 storedNumber;
    }

    // Mapping pour associer chaque compte à ses données
    mapping(address => UserData) public userMapping;

    // Fonction pour enregistrer un nombre associé à l'adresse du compte
    function storeNumber(uint256 _number) external {
        // Vérifier si le compte a déjà enregistré un nombre
        require(userMapping[msg.sender].account == address(0), "Number already stored for this account");

        // Enregistrer le nombre associé au compte
        userMapping[msg.sender] = UserData(msg.sender, _number);
    }

    // Fonction pour récupérer le nombre enregistré par le compte
    function retrieveNumber() external view returns (uint256) {
        // Vérifier que le compte a enregistré un nombre
        require(userMapping[msg.sender].account != address(0), "No number stored for this account");

        // Récupérer le nombre associé au compte
        return userMapping[msg.sender].storedNumber;
    }
}
