pragma solidity ^0.4.21;

contract TicketSale {

    // <contract_variables>
    
    address private owner;
    mapping (address => uint16) tickets;
    mapping (uint16 => address) ticketsSold;
    uint16 ticketCount;
    uint256 private ticketPrice;
    mapping (address => address) swapOffers;
    
    // </contract_variables>

    constructor(uint16 numTickets, uint256 price) public {
        ticketCount = numTickets;
        owner = msg.sender;
        ticketPrice = price;
    }

    function buyTicket(uint16 ticketId) public payable {
        require(ticketId >= 1 && ticketId <= ticketCount); // valid identifier
        require(ticketsSold[ticketId] == 0); // not sold yet
        require(tickets[msg.sender] == 0); // no ticket
        require(msg.value == ticketPrice); // correct amount of Ether
        tickets[msg.sender] = ticketId;
        ticketsSold[ticketId] = msg.sender;
    }

    function getTicketOf(address person) public view returns (uint16) {
        return tickets[person];
    }

    function offerSwap(address partner) public {
        require(tickets[msg.sender] > 0); // sender has ticket
        require(partner != msg.sender); // partner is not sender
        swapOffers[msg.sender] = partner;
    }

    function acceptSwap(address partner) public {
        require(tickets[msg.sender] > 0); // sender has a ticket
        require(swapOffers[partner] == msg.sender); // partner wants to swap with sender
        (tickets[msg.sender], tickets[partner]) = (tickets[partner], tickets[msg.sender]); // swap
        ticketsSold[tickets[msg.sender]] = msg.sender;
        ticketsSold[tickets[partner]] = partner;
        swapOffers[partner] = 0;
    }

    function withdraw() public {
        require(msg.sender == owner); // sender is owner
        msg.sender.transfer(address(this).balance);
    }

}
