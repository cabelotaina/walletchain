pragma solidity ^0.4.11;

contract JobContract{

	uint public timestamp_enter;
	uint public timestamp_exit;

  uint8 public day_hours;

  mapping (bytes32 => uint8) public spend_hours_per_day;

  bytes32[] public candidateList;

	function JobContract(uint8 dh) {
		day_hours = dh;
	}


	function enter(uint timestamp ){
		timestamp_enter = timestamp;
	}

	function exit(uint timestamp) {
		timestamp_exit = timestamp;
	}

	function get_work_today() public returns (uint) {
		return timestamp_exit - timestamp_enter;
	}

	function get_type() public returns (string) {
		return 'CLT';
	}

}