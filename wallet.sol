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

	function Wallet(string email, string name, string nationality, string birthdate){
		_email = email;
		_name = name;
		_nationality = nationality;
		_birthdate = birthdate;
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

	function promote_contract(address _contract) onlyBy(_owner) {
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