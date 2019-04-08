pragma solidity >=0.4.21 <0.6.0;

contract FinIQ_Core{
    struct RFQ {
        string shareName;
        uint quantity;
        uint rfq_id;
        uint timeStamp;        
    }

    uint rfq_id = 0;
    address sellSide;
    mapping(uint=>RFQ) public rfq;

    struct Response {
        uint response_id;
        uint price;
        uint rfq_id;
    }
    
    uint response_id = 0;

    /* This creates an array with all prices */
    mapping (uint => Response) public response;
    

    event Request(address sellSide, string shareName, uint quantity, uint rfq_id);

    
    function updateCreateRFQ(string memory shareName, uint quantity) public returns(uint ) {
        uint id;
        id = _generate_rfq_id();
        uint timeStamp;
        timeStamp = block.timestamp;
        //RFQ storage rfqnew = rfq[id];
        rfq[id] = RFQ(shareName,quantity,id,timeStamp);

        return id ;

    }

    function _generate_rfq_id() public  returns(uint){
        return rfq_id += 1;
    }
    
    
    
    
    function updateResponse  (uint rfqId,uint price) public returns (uint) {
        uint resp_id;
        resp_id = _generate_response_id();
        
        response[resp_id] = Response(resp_id,price,rfqId);

        
        return resp_id;

    }
    function _generate_response_id() public returns (uint){
        return response_id += 1;
    }

}