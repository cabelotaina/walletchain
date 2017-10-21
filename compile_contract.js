module.exports = function (contract, name) {

		Web3 = require('web3')

		web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

		solc = require('solc')

		var contractwl = 'wallet.sol'; var namewl = ':Wallet';
		compiledCodewl = solc.compile(fs.readFileSync(contractwl).toString())
		abiDefinitionwl = JSON.parse(compiledCodewl.contracts[namewl].interface)
		wlContract = web3.eth.contract(abiDefinitionwl)
		byteCode = compiledCodewl.contracts[namewl].bytecode
		deployedContractwl = wlContract.new(5,{data: byteCode, from: web3.eth.accounts[0], gas: 4700000})
		contractInstancewl = wlContract.at(deployedContractwl.address)

		var contractjc = 'job_contract.sol'; var namejc = ':JobContract';
		compiledCodejc = solc.compile(fs.readFileSync(contractjc).toString())
		abiDefinitionjc = JSON.parse(compiledCodejc.contracts[namejc].interface)
		jcContract = web3.eth.contract(abiDefinitionjc)
		byteCode = compiledCodejc.contracts[namejc].bytecode
		deployedContractjc = jcContract.new(5,{data: byteCode, from: web3.eth.accounts[1], gas: 4700000})
		contractInstancejc = jcContract.at(deployedContractjc.address)

	}

// var contract = 'job_contract.sol'; var name = ':jobContract';

// contractInstancejc.enter.call()