DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS commands CASCADE;
DROP TABLE IF EXISTS arguments CASCADE;


CREATE TABLE categories (
    categories_id serial NOT NULL,
    category TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (categories_id)
);

CREATE TABLE commands (
    commands_id serial NOT NULL,
    command TEXT NOT NULL,
    argument TEXT NOT NULL,
    description TEXT NOT NULL,
    categories_id INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (commands_id)
);
CREATE TABLE arguments (
    arguments_id serial NOT NULL,
    argument TEXT NOT NULL,
    commands_id TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (arguments_id)
);

insert into categories ( category) values ('Blockchain');
insert into categories ( category) values ('Control' );
insert into categories ( category) values ('Generating');
-- insert into categories ( category) values ('Mining' );
insert into categories ( category) values ('Network');
insert into categories ( category) values ('Rawtransactions');
insert into categories ( category) values ('Util');
insert into categories ( category) values ('Wallet');


insert into commands ( command,argument, description, categories_id) values ( 'getbestblockhash','getbestblockhash', 'Returns the hash of the best (tip) block in the most-work fully-validated chain.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getblock','getblock "blockhash" ( verbosity )', 'If verbosity is 0, returns a string that is serialized, hex-encoded data for block "hash".If verbosity is 1, returns an Object with information about block "hash".If verbosity is 2, returns an Object with information about block "hash" and information about each transaction.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getblockchaininfo','getblockchaininfo','Returns an object containing various state info regarding blockchain processing.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getblockcount','getblockcount','Returns the height of the most-work fully-validated chain.The genesis block has height 0.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getblockhash','getblockhash height', 'Returns hash of block in best-block-chain at height provided.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getblockheader','getblockheader "blockhash" ( verbose )','If verbose is false, returns a string that is serialized, hex-encoded data for blockheader "hash".If verbose is true, returns an Object with information about blockheader "hash".','1');
insert into commands ( command,argument, description, categories_id) values ( 'getchaintips','getchaintips','Return information about all known tips in the block tree, including the main chain as well as orphaned branches.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getdifficulty','getdifficulty','Returns the proof-of-work difficulty as a multiple of the minimum difficulty.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getmempoolancestors','getmempoolancestors "txid" ( verbose )', 'If txid is in the mempool, returns all in-mempool ancestors.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getmempooldescendants','getmempooldescendants "txid" ( verbose )', 'If txid is in the mempool, returns all in-mempool descendants.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getmempoolentry','getmempoolentry "txid"', 'Returns mempool data for given transaction','1');
insert into commands ( command,argument, description, categories_id) values ( 'getmempoolinfo','getmempoolinfo', 'Returns details on the active state of the TX memory pool.','1');
insert into commands ( command,argument, description, categories_id) values ( 'getrawmempool','getrawmempool ( verbose mempool_sequence )', 'Returns all transaction ids in memory pool as a json array of string transaction ids.Hint: use getmempoolentry to fetch a specific transaction from the mempool.','1');
insert into commands ( command,argument, description, categories_id) values ( 'gettxout', '"txid" n ( include_mempool )', 'Returns details about an unspent transaction output.','1');
insert into commands ( command,argument, description, categories_id) values ( 'gettxoutproof','gettxoutproof ["txid",...] ( "blockhash" )', 'Returns a hex-encoded proof that "txid" was included in a block.NOTE: By default this function only works sometimes. This is when there is an unspent output in the utxo for this transaction. To make it always work, you need to maintain a transaction index, using the -txindex command,argument line option or specify the block in which the transaction is included manually (by blockhash).','1');
insert into commands ( command,argument, description, categories_id) values ( 'gettxoutsetinfo','gettxoutsetinfo ( "hash_type" )', 'Returns statistics about the unspent transaction output set.Note this call may take some time.','1');
insert into commands ( command,argument, description, categories_id) values ( 'preciousblock','preciousblock "blockhash"', 'Treats a block as if it were received before others with the same work.A later preciousblock call can override the effect of an earlier one.The effects of preciousblock are not retained across restarts.','1');
insert into commands ( command,argument, description, categories_id) values ( 'pruneblockchain','pruneblockchain height','nothing','1');
insert into commands ( command,argument, description, categories_id) values ( 'verifychain','verifychain ( checklevel nblocks )', 'Verifies blockchain database.','1');
insert into commands ( command,argument, description, categories_id) values ( 'verifytxoutproof','verifytxoutproof "proof"', 'Verifies that a proof points to a transaction in a block, returning the transaction it commits to and throwing an RPC error if the block is not in our best chain','1');

insert into commands ( command, argument, description, categories_id) values ( 'getinfo','No Information','nothing','2');
insert into commands ( command, argument, description, categories_id) values ( 'getmemoryinfo','getmemoryinfo ( "mode" )', 'Returns an object containing information about memory usage.','2');
insert into commands ( command, argument, description, categories_id) values ( 'stop','stop', 'Request a graceful shutdown of Bitcoin Core.','2');

insert into commands ( command, argument, description, categories_id) values ( 'generate','generatetoaddress nblocks ( maxtries auxpow )','nothting','3');
insert into commands ( command, argument, description, categories_id) values ( 'generatetoaddress','generatetoaddress nblocks "address" ( maxtries )', 'Mine blocks immediately to a specified address (before the RPC call returns)','3');

insert into commands ( command, argument, description, categories_id) values ( 'addnode','addnode "node" "command"', 'Attempts to add or remove a node from the addnode list. Or try a connection to a node once.Nodes added using addnode (or -connect) are protected from DoS disconnection and are not required to be full nodes/support SegWit as other outbound peers are (though such peers will not be synced from).','5');
insert into commands ( command, argument, description, categories_id) values ( 'clearbanned','clearbanned', 'Clear all banned IPs.','5');
insert into commands ( command, argument, description, categories_id) values ( 'disconnectnode','disconnectnode "[address]" [nodeid]', 'Immediately disconnects from the specified peer node.','5');
insert into commands ( command, argument, description, categories_id) values ( 'getaddednodeinfo','getaddednodeinfo ( "node" )', 'The getaddednodeinfo RPC returns information about the given added node, or all added nodes (except onetry nodes). Only nodes which have been manually added using the `addnode` RPC will have their information displayed.','5');
insert into commands ( command, argument, description, categories_id) values ( 'getconnectioncount','getconnectioncount','The getconnectioncount RPC returns the number of connections to other nodes.','5');
insert into commands ( command, argument, description, categories_id) values ( 'getnettotals','getnettotals','The getnettotals RPC returns information about network traffic, including bytes in, bytes out, and the current time.','5');
insert into commands ( command, argument, description, categories_id) values ( 'getnetworkinfo','getnetworkinfo,','The getnetworkinfo RPC returns information about the node connection to the network.','5');
insert into commands ( command, argument, description, categories_id) values ( 'ping','ping', 'Requests that a ping be sent to all other nodes, to measure ping time. Results provided in getpeerinfo, pingtime and pingwait fields are decimal seconds. Ping command is handled in queue with all other commands, so it measures processing backlog, not just network ping.','5');
insert into commands ( command, argument, description, categories_id) values ( 'getpeerinfo','getpeerinfo', 'Returns data about each connected network node as a json array of objects..','5');
insert into commands ( command, argument, description, categories_id) values ( 'listbanned','listbanned', 'List all manually banned IPs/Subnets.','5');
insert into commands ( command, argument, description, categories_id) values ( 'setban','setban "subnet" "command" ( bantime absolute )', 'Attempts to add or remove an IP/Subnet from the banned list.','5');
insert into commands ( command, argument, description, categories_id) values ( 'setnetworkactive','setnetworkactive state', 'Disable/enable all p2p network activity.','5');

insert into commands ( command, argument, description, categories_id) values ( 'createrawtransaction','createrawtransaction [{"txid":"hex","vout":n,"sequence":n},...] [{"address":amount},{"data":"hex"},...] ( locktime replaceable )','Create a transaction spending the given inputs and creating new outputs. Outputs can be addresses or data. Returns hex-encoded raw transaction. Note that the transaction s inputs are not signed, and it is not stored in the wallet or transmitted to the network.','6');
insert into commands ( command, argument, description, categories_id) values ( 'decoderawtransaction','decoderawtransaction "hexstring" ( iswitness )', 'Return a JSON object representing the serialized, hex-encoded transaction.','6');
insert into commands ( command, argument, description, categories_id) values ( 'fundrawtransaction','fundrawtransaction "hexstring" ( options iswitness )', 'If the transaction has no inputs, they will be automatically selected to meet its out value. It will add at most one change output to the outputs.No existing outputs will be modified unless "subtractFeeFromOutputs" is specified.Note that inputs which were signed may need to be resigned after completion since in/outputs have been added.The inputs added will not be signed, use signrawtransactionwithkeyor signrawtransactionwithwallet for that.Note that all existing inputs must have their previous output transaction be in the wallet.Note that all inputs selected must be of standard form and P2SH scripts must be in the wallet using importaddress or addmultisigaddress (to calculate fees).You can see whether this is the case by checking the "solvable" field in the listunspent output.Only pay-to-pubkey, multisig, and P2SH versions thereof are currently supported for watch-only','6');
insert into commands ( command, argument, description, categories_id) values ( 'decodescript','decodescript "hexstring"','Decode a hex-encoded script.','6');
insert into commands ( command, argument, description, categories_id) values ( 'generatetoaddress','generatetoaddress nblocks "address" ( maxtries )','Mine blocks immediately to a specified address (before the RPC call returns) Decode a hex-encoded script.','6');
insert into commands ( command, argument, description, categories_id) values ( 'getrawtransaction','getrawtransaction','Return the raw transaction data.By default this function only works for mempool transactions. When called with a blockhash argument, getrawtransaction will return the transaction if the specified block is available and the transaction is found in that block. When called without a blockhash argument, getrawtransaction will return the transaction if it is in the mempool, or if -txindex is enabled and the transaction is in a block in the blockchain.Hint: Use gettransaction for wallet transactions.If verbose is "true", returns an Object with information about "txid".If verbose is "false" or omitted, returns a string that is serialized, hex-encoded data for "txid".','6');
insert into commands ( command, argument, description, categories_id) values ( 'sendrawtransaction','sendrawtransaction "hexstring" ( maxfeerate )', 'Submit a raw transaction (serialized, hex-encoded) to local node and network.Note that the transaction will be sent unconditionally to all peers, so using this for manual rebroadcast may degrade privacy by leaking the transaction s origin, as nodes will normally not rebroadcast non-wallet transactions already in their mempool.Also see createrawtransaction and signrawtransactionwithkey calls.','6');
insert into commands ( command, argument, description, categories_id) values ( 'signrawtransaction','signrawtransactionwithkey "hexstring" ["privatekey",...] ( [{"txid":"hex","vout":n,"scriptPubKey":"hex","redeemScript":"hex","witnessScript":"hex","amount":amount},...] "sighashtype" )', 'Sign inputs for raw transaction (serialized, hex-encoded).The second argument is an array of base58-encoded private keys that will be the only keys used to sign the transaction.The third optional argument (may be null) is an array of previous transaction outputs that this transaction depends on but may not yet be in the block chain.','6');


insert into commands ( command, argument, description, categories_id) values ( 'createmultisig','createmultisig nrequired ["key",...] ( "address_type" )', 'Creates a multi-signature address with n signature of m keys required.It returns a json object with the address and redeemScript.','7');
insert into commands ( command, argument, description, categories_id) values ( 'estimatefee','estimatefee nblocks', 'Estimates the approximate fee per kilobyte needed for a transaction to begin confirmation within nblocks blocks. Uses virtual transaction size of transaction as defined in BIP 141 (witness data is discounted)','7');
insert into commands ( command, argument, description, categories_id) values ( 'estimatesmartfee','estimatesmartfee conf_target ( "estimate_mode" )', 'Estimates the approximate fee per kilobyte needed for a transaction to begin confirmation within conf_target blocks if possible and return the number of blocks for which the estimate is valid. Uses virtual transaction size as defined in BIP 141 (witness data is discounted).','7');
insert into commands ( command, argument, description, categories_id) values ( 'signmessagewithprivkey','signmessagewithprivkey "privkey" "message"', 'Sign a message with the private key of an address','7');
insert into commands ( command, argument, description, categories_id) values ( 'validateaddress','validateaddress "address"', 'Return information about the given dogecoin address.','7');
insert into commands ( command, argument, description, categories_id) values ( 'verifymessage','verifymessage "address" "signature" "message"', 'Verify a signed message','7');

insert into commands ( command, argument, description, categories_id) values ( 'abandontransaction','abandontransaction "txid"', 'Mark in-wallet transaction <txid> as abandoned This will mark this transaction and all its in-wallet descendants as abandoned which will allow for their inputs to be respent. It can be used to replace "stuck" or evicted transactions.It only works on transactions which are not included in a block and are not currently in the mempool.It has no effect on transactions which are already abandoned.','7');
insert into commands ( command, argument, description, categories_id) values ( 'addmultisigaddress','addmultisigaddress nrequired ["key",...] ( "label" "address_type" )', 'Add an nrequired-to-sign multisignature address to the wallet. Requires a new wallet backup.Each key is a Bitcoin address or hex-encoded public key.This functionality is only intended for use with non-watchonly addresses.See importaddress for watchonly p2sh address support.If "label" is specified, assign address to that label.','7');
insert into commands ( command, argument, description, categories_id) values ( 'addwitnessaddress','addwitnessaddress "address"', 'Add a witness address for a script','7');
insert into commands ( command, argument, description, categories_id) values ( 'backupwallet','backupwallet "destination"', 'Safely copies current wallet file to destination, which can be a directory or a path with filename.','7');
insert into commands ( command, argument, description, categories_id) values ( 'bumpfee','bumpfee "txid" ( options )', 'Bumps the fee of an opt-in-RBF transaction T, replacing it with a new transaction B.An opt-in RBF transaction with the given txid must be in the wallet.The command will pay the additional fee by reducing change outputs or adding inputs when necessary.It may add a new change output if one does not already exist.All inputs in the original transaction will be included in the replacement transaction.The command will fail if the wallet or mempool contains a transaction that spends one of Ts outputs.By default, the new fee will be calculated automatically using the estimatesmartfee RPC.The user can specify a confirmation target for estimatesmartfee.Alternatively, the user can specify a fee rate in sat/vB for the new transaction.At a minimum, the new fee rate must be high enough to pay an additional new relay fee (incrementalfee returned by getnetworkinfo) to enter the node s mempool.','7');
insert into commands ( command, argument, description, categories_id) values ( 'dumpprivkey','dumpprivkey "address"', 'Reveals the private key corresponding to "address".Then the importprivkey can be used with this output.','7');
insert into commands ( command, argument, description, categories_id) values ( 'generatetoaddress','dumpwallet "filename"', 'Dumps all wallet keys in a human-readable format to a server-side file. This does not allow overwriting existing files.Imported scripts are included in the dumpfile, but corresponding BIP173 addresses, etc. may not be added automatically by importwallet.Note that if your wallet contains keys which are not derived from your HD seed (e.g. imported keys), these are not covered by only backing up the seed itself, and must be backed up too (e.g. ensure you back up the whole dumpfile).','7');
insert into commands ( command, argument, description, categories_id) values ( 'getaccount','getbalance ( "dummy" minconf include_watchonly avoid_reuse )', 'Returns the total available balance.The available balance is what the wallet considers currently spendable, and is thus affected by options which limit spendability such as -spendzeroconfchange.','7');
insert into commands ( command, argument, description, categories_id) values ( 'getnewaddress','getnewaddress ( "label" "address_type" )', 'Returns a new Bitcoin address for receiving payments.If "label" is specified, it is added to the address book so payments received with the address will be associated with "label".','7');
insert into commands ( command, argument, description, categories_id) values ( 'getrawchangeaddress','getrawchangeaddress ( "address_type" )', 'Returns a new Bitcoin address, for receiving change.This is for use with raw transactions, NOT normal use.','7');
insert into commands ( command, argument, description, categories_id) values ( 'getreceivedbyaddress','getreceivedbyaddress "address" ( minconf )', 'Returns the total amount received by the given address in transactions with at least minconf confirmations.','7');
insert into commands ( command, argument, description, categories_id) values ( 'gettransaction','gettransaction "txid" ( include_watchonly verbose )', 'Get detailed information about in-wallet transaction <txid>','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');
-- insert into commands ( command, description, categories_id) values ( 'generatetoaddress','','7');


insert into arguments ( argument, commands_id ) values ( 'limit', '1');
insert into arguments ( argument, commands_id ) values ( 'account', '2');
