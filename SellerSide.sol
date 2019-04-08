pragma solidity >=0.4.21 <0.6.0;
import "./FinIQ_Core.sol";

contract SellerSide {
    FinIQ_Core fc;
    uint response_id;

    function Response (uint rfqId, uint price) public returns(uint ) {
        response_id = fc.updateResponse(rfqId, price);
        return response_id;
    }

}	
