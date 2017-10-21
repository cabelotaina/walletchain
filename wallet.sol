pragma solidity ^0.4.11;

contract Wallet{
	string private _owner;
	string private _name;
	string private _document;
	string private _document_type;
	string private _nationality;


	address[] contracts;
	address[] pending_contracts;

	function Wallet(string owner, string name, string document, string document_type, string nationality){
		_owner = owner;
		_name = name;
		_document = document;
	}

	function addContract(address _contract) {
		pending_contracts.push(_contract);
	}

	function getPendings() returns (address[]){
		return pending_contracts;
	}

	function promote_contract(address _contract) {
		//if (owner == 	msg.sender) throw;
		for(uint i = 0; i < pending_contracts.length; i++) {
      if (_contract == pending_contracts[i]) {
        delete pending_contracts[i];
      }
    }
    contracts.push(_contract);
	}
}