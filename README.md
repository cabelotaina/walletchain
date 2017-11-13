# Walletchain

This project wants to create a simple job wallet for a universal worker.

We use a smart contract example to maintain workers history.

Warning: From solidity documentation:

-- Everything that is inside a contract is visible to all external observers. Making something private only prevents other contracts from accessing and modifying the information, but it will still be visible to the whole world outside of the blockchain.


## Start rpc

node_modules/.bin/testrpc

![TesteRPC](./rpc.png)

## Settings

For test purpose, we started with Web3, an Ethereum JavaScript API and solc, a solidity compiler. And finally, use testrpc to maintain a 

```Javascript
		Web3 = require('web3')

		web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

		solc = require('solc')
```

Main commands for compile and set a smart contract. We need a function for this and a assert test, and we add our worker wallet with this few commands.

```Javascript
		var contractwl = 'wallet.sol'; var namewl = ':Wallet';
		compiledCodewl = solc.compile(fs.readFileSync(contractwl).toString())
		abiDefinitionwl = JSON.parse(compiledCodewl.contracts[namewl].interface)
		wlContract = web3.eth.contract(abiDefinitionwl)
		byteCode = compiledCodewl.contracts[namewl].bytecode
		
		// calculate the hash function
		var sha256 = require('js-sha256');
		var hash = sha256.hmac.create('key');
		hash.update('Message to hash');
		hash.hex();
		
		deployedContractwl = wlContract.new(hash.hex(), {data: byteCode, from: web3.eth.accounts[0], gas: 4700000})
		contractInstancewl = wlContract.at(deployedContractwl.address)

		var hash2 = sha256.hmac.create('key2');
		hash2.update('Message to hash');

		contractInstancewl.updateHashData(hash2.hex(), {from: web3.eth.accounts[0], gas:100000})

		contractInstancewl.getHashData.call()
```

## Command Lists

For our example we need a simple contract. 

```Javascript
		var contractjc = 'job_contract.sol'; var namejc = ':JobContract';
		compiledCodejc = solc.compile(fs.readFileSync(contractjc).toString())
		abiDefinitionjc = JSON.parse(compiledCodejc.contracts[namejc].interface)
		jcContract = web3.eth.contract(abiDefinitionjc)
		byteCode = compiledCodejc.contracts[namejc].bytecode
		deployedContractjc = jcContract.new(5,{data: byteCode, from: web3.eth.accounts[1], gas: 4700000})
		contractInstancejc = jcContract.at(deployedContractjc.address)

```

If you want to add a new pending contract on worker's wallet, you need add this contract on worker wallet, for this inform the address of contract, your account (we use test rpc defaut account e.g. from: web3.eth.accounts[number]), and pay a amount of gas.

```Javascript
	address = '0x5e49cf02472ec0356220ec27f2ba0494eb06298e4c2fa9d3db03cff7f6e6fee7';
	contractInstancewl.addContract(address,{from: web3.eth.accounts[1], gas:100000})
```

Now we have a new contract on pending array. How we see with this command:

```Javascript
contractInstancewl.getPendings.call({from: web3.eth.accounts[1]});
```

In the next step the worker swap the contract for your contract's list:

```Javascript
	address = '0x5e49cf02472ec0356220ec27f2ba0494eb06298e4c2fa9d3db03cff7f6e6fee7';
	contractInstancewl.promoteContract(address,{from: web3.eth.accounts[0], gas:100000})
```
