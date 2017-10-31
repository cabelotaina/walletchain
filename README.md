# Walletchain

This project wants to create a simple job wallet for a worker.

We use a smart contract example to maintain workers history.


-- Everything that is inside a contract is visible to all external observers. Making something private only prevents other contracts from accessing and modifying the information, but it will still be visible to the whole world outside of the blockchain.

## Settings

```Javascript
		Web3 = require('web3') // Ethereum JavaScript API

		web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

		solc = require('solc') // solidity compiler
```

Main commands for compile and set a smart contract. We need a function for this and a assert test.

```Javascript
		var contractwl = 'wallet.sol'; var namewl = ':Wallet';
		compiledCodewl = solc.compile(fs.readFileSync(contractwl).toString())
		abiDefinitionwl = JSON.parse(compiledCodewl.contracts[namewl].interface)
		wlContract = web3.eth.contract(abiDefinitionwl)
		byteCode = compiledCodewl.contracts[namewl].bytecode
		deployedContractwl = wlContract.new("mau", {data: byteCode, from: web3.eth.accounts[0], gas: 4700000})
		contractInstancewl = wlContract.at(deployedContractwl.address)
```

## Command Lists

If you need create a new transaction with blockchain you need pay a amount of gas and inform the account (from: web3.eth.accounts[number]).

```Javascript
	contractInstancewl.addContract(0x5e49cf02472ec0356220ec27f2ba0494eb06298e4c2fa9d3db03cff7f6e6fee7,{from: web3.eth.accounts[0], gas:100000})
```

To make local test's, before you make future transactions we use .call(parameters) 

```Javascript
contractInstancewl.getPendings.call({from: web3.eth.accounts[0]});
```


TODO: survey about smart contract external security, use hash or symetric encryption for protect sensitive data, create generec example contracts to put on worker wallet.