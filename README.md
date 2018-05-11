# Ticket Sale

BME VIK Blockchain HF - Ticket Sale - Ethereum Solidity

1. [Specification](http://home.mit.bme.hu/~ikocsis/BC2018HF/solidity_22.html)
2. [Documentation](https://docs.google.com/document/d/1MGYwYwBeXrbyT4YSnRYcegcpcFlzgO_t58J6fvdlf3w/edit)
3. [Assignment](http://home.mit.bme.hu/~ikocsis/BC2018HF/README.html)

[Solidity docs](http://solidity.readthedocs.io/en/v0.4.21/index.html)


### Specification
#### Problem statement
Implement a smart contract for selling tickets to events.
* The creator of the contract is the owner.
* The owner specifies the number and price of the tickets.
* People can buy tickets directly from the contract.
* Anyone can validate whether a given address owns a ticket.
* One person can only buy one ticket.
* People can safely swap tickets through the contract.
* The owner can withdraw any profits.

#### Example scenario
Sziget Festival decides to use this contract to sell day tickets. They create an instance for 100,000 tickets, setting the price at the wei equivalent of 10,000HUF.

In this case, the ticket identifiers go from 1 to 100,000. People can check the type of any ticket based on this id on the festival's website, e.g. tickets 1 to 10,000 are for Monday, 10,001 to 20,000 are for Tuesday, etc.

Alice and Bob both buy tickets, #784 and #10,322 respectively, paying the wei equivalent of 10,000HUF each. However, Alice wants to go on Tuesday instead, and Bob would rather go on Monday. Thus, they decide to swap. For this, Alice submits a swap offer between their Ethereum addresses. Bob accepts the offer. In the end, Alice owns ticket #10,322, while Bob owns ticket #784.

On the day of the festival, the festival staff scans Alice's QR code at the entrance. The system checks whether Alice has a ticket and whether that ticket is valid at that time. After this, Alice can go in and enjoy the festival.

#### Contract interface

* constructor: function TicketSale(uint16 numTickets, uint256 price)
  * Create a ticket sale with numTickets tickets, each sold for price wei.
  * The sender of the transaction (msg.sender) is the owner.

* buy ticket: function buyTicket(uint16 ticketId) payable
  * The sender of the transaction (msg.sender) buys ticketId for the specified price.
  * Succeeds only if ticketId is a valid ticket identifier, the ticket has not yet been sold, the sender has not bought a ticket yet, and he/she sends the correct amount of ether.

* get ticket id: function getTicketOf(address person) view returns (uint16)
  * Returns the ticket id associated with the address person, or 0 in case person does not have a ticket.

* offer swap: function offerSwap(address partner)
  * The sender of the transaction (msg.sender) submits an offer for swapping their ticket with partner.

* accept swap offer: function acceptSwap(address partner)
  * The sender of the transaction (the buyer) accepts the swap offer of partner.
  * Succeeds only if both parties (msg.sender and partner) have tickets, and there is a swap offer submitted by partner for msg.sender.
  * After the transaction, the tickets of the two parties are swapped, and the offer is destroyed.

* withdraw: function withdraw()
  * Withdraw any funds on the contract.
  * Only the owner can call this method.
  
#### Contract skeleton
```pragma solidity ^0.4.21;

contract TicketSale {

    // <contract_variables>

    // </contract_variables>

    function TicketSale(uint16 numTickets, uint256 price) public {
        // TODO
    }

    function buyTicket(uint16 ticketId) public payable {
        // TODO
    }

    function getTicketOf(address person) public view returns (uint16) {
        // TODO
    }

    function offerSwap(address partner) public {
        // TODO
    }

    function acceptSwap(address partner) public {
        // TODO
    }

    function withdraw() public {
        // TODO
    }

}```
