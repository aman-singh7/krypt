// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Transactions {
    uint transactionCount;

    event TransferEvent(
        address from,
        address to,
        uint amount,
        string message,
        uint timestamp,
        string keyword
    );

    struct Transaction {
        address from;
        address to;
        uint amount;
        string message;
        uint timestamp;
        string keyword;
    }

    Transaction[] transactions;

    function addToBlockchain(
        address payable receiver,
        uint amount,
        string memory message,
        string memory keyword
    ) public {
        transactionCount += 1;
        transactions.push(
            Transaction(
                msg.sender,
                receiver,
                amount,
                message,
                block.timestamp,
                keyword
            )
        );

        emit TransferEvent(
            msg.sender,
            receiver,
            amount,
            message,
            block.timestamp,
            keyword
        );
    }

    function getAllTransactions() public view returns (Transaction[] memory) {
        return transactions;
    }

    function getTransactionCount() public view returns (uint) {
        return transactionCount;
    }
}
