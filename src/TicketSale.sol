pragma solidity ^0.4.21;

contract TicketSale {

    // <contract_variables>
    address private owner;
    mapping (address => uint16) tickets;
    mapping (uint16 => address) ticketsSold;
    uint16 ticketCount;
    uint256 private ticketPrice;
    // </contract_variables>

    constructor(uint16 numTickets, uint256 price) public {
        // TODO
        ticketCount = numTickets;
        owner = msg.sender;
        ticketPrice = price;
    }

    function buyTicket(uint16 ticketId) public payable {
        // TODO
        require(ticketId >= 1 && ticketId <= ticketCount); // valid identifier
        require(ticketsSold[ticketId] == 0); // not sold yet
        require(tickets[msg.sender] == 0); // no ticket
        require(msg.value == ticketPrice); // correct amount of Ether
        tickets[msg.sender] = ticketId;
        ticketsSold[ticketId] = msg.sender;
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

}
