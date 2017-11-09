pragma solidity ^0.4.11;

contract Time {

	address internal _owner = msg.sender;
	address internal _machine;
	address internal _worker;
	uint internal _amount;

	uint internal _checkin;
	uint internal _checkout;

	function Time(address worker, address machine) payable {
		_worker = worker;
		_machine = machine;
		_amount = msg.value;
	  _checkin = 0;
	  _checkout = 0;
	}

	function checkin() onlyBy(_machine) {
		_checkin = _checkin + 1;
	}

	function checkout() onlyBy(_machine) {
		_checkout = _checkout + 1;
	}

  function withdraw() onlyBy(_worker) {
  	// uint sum = _checkin + _checkout
  	// if( sum == 2) revert();
  	uint aux = _amount;
  	_amount = 0;
  	_owner.transfer(_amount);
  }

  modifier onlyBy(address _account) {
		require(msg.sender == _account);
		_;
	}

}