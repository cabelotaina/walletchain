pragma solidity ^0.4.11;

contract Wallet{
	address internal _owner = msg.sender;

  string internal _hash;

	address[] internal contracts;
	address[] internal pending_contracts;

	function Wallet(string hash){
		_hash = hash;
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

	function getHashData() returns (string) {
		return _hash;
	}

	function updateHashData(string hash) onlyBy(_owner) {
		_hash = hash;
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