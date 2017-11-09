var contractTime = 'time.sol'; var nameTime = ':Time';
compiledCodeTime = solc.compile(fs.readFileSync(contractTime).toString())
abiDefinitionTime = JSON.parse(compiledCodeTime.contracts[nameTime].interface)
timeContract = web3.eth.contract(abiDefinitionTime)
byteCodeTime = compiledCodeTime.contracts[nameTime].bytecode
deployedContractTime = timeContract.new(web3.eth.accounts[0], web3.eth.accounts[1], {data: byteCodeTime, from: web3.eth.accounts[2], gas: 4700000, value: 2})


deployedContractTime.checkin({from: web3.eth.accounts[1], gas: 2000000})

deployedContractTime.checkout({from: web3.eth.accounts[1], gas: 2000000})

deployedContractTime.withdraw({from: web3.eth.accounts[0], gas: 200000})

deployedContractTime.withdraw.call({from: web3.eth.accounts[0], gas: 200000})

web3.fromWei(web3.eth.accounts[0], 'ether')

'981631345170535534521502568987.710383846108187471'