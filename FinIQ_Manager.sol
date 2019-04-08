pragma solidity >=0.4.21 <0.6.0;
import "./BuyerSide.sol" as BuyerSide;
import "./SellerSide.sol" as SellerSide;

contract FinIQ_Manager {
    address[] buyerCopies;
    address[] sellerCopies;
    uint buyer_count = 0;
    uint seller_count = 0;
    
    function createBuyer () public returns (address){
        address buyerCopy = address(new BuyerSide.BuyerSide());
        buyerCopies.push(buyerCopy);
        buyer_count += 1;
        return buyerCopies[buyer_count];
    }

    function createSeller () public returns (address){
        address sellerCopy = address(new SellerSide.SellerSide());
        sellerCopies.push(sellerCopy);
        seller_count += 1;
        return sellerCopies[seller_count];
    } 
    
    /*
    function getAddress () public returns (address){
        BuyerSide newBuyer = BuyerSide(buyerCopies[count]);
        address newAddress = newBuyer.BuyerAddress();
        count += 1;
        return newAddress;
    }
    */
}