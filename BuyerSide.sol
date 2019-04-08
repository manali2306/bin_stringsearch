pragma solidity >=0.4.21 <0.6.0;
import "./FinIQ_Core.sol";

contract BuyerSide {
    FinIQ_Core fc;
    uint RFQ_id;

    function CreateRFQ (string memory shareName, uint quantity) public returns(uint ) {
        RFQ_id = fc.updateCreateRFQ (shareName, quantity);
        return RFQ_id;
    }

}