var FinIQ_Core = artifacts.require("FinIQ_Core");

module.exports = function(deployer){
    deployer.deploy(FinIQ_Core);
};

var BuyerSide = artifacts.require("BuyerSide");

module.exports = function(deployer){
    deployer.deploy(BuyerSide);
};

var SellerSide = artifacts.require("SellerSide");

module.exports = function(deployer){
    deployer.deploy(SellerSide);
};

var FinIQ_Manager = artifacts.require("FinIQ_Manager");

module.exports = function(deployer){
    deployer.deploy(FinIQ_Manager);
};