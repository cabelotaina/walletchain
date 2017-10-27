pragma solidity ^0.4.11;

contract Wallet{
	address internal _owner = msg.sender;

  string internal _email;
	string internal _name;
	string internal _document;
	string internal _document_type;
	string internal _nationality;
	string internal _birthdate;


	address[] internal contracts;
	address[] internal pending_contracts;

	function Wallet(string name){
		// _email = email;
		_name = name;
		// _document = document;
		// _document_type = document_type;
		// _nationality = nationality;
		// _birthdate = birthdate;
	}


	modifier onlyBy(address _account) {
		require(msg.sender == _account);
		_;
	}

	function addContract(address _contract) {
		pending_contracts.push(_contract);
	}

	function getPendings() onlyBy(_owner) returns (address[]) {
		return pending_contracts;
	}

	function promote_contract(address _contract) {
		swap(_contract);
	}

	function swap(address _contract) internal{
		for(uint i = 0; i < pending_contracts.length; i++) {
      if (_contract == pending_contracts[i]) {
        delete pending_contracts[i];
      }
    }
	  contracts.push(_contract);
	}
}