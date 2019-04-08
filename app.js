    App = {
    web3Provider : null,
    contracts :{},

    init: async function(){
      return await App.initWeb3();
    },

    initWeb3: async function() {
      var Web3 = require('web3');
      var web3 = new Web3();
      if(typeof web3 !== 'undefined'){
        web3 = new Web3(web3.currentProvider);
      } else{
        web3.setProvider(new web3.providers.HttpProviders("http://127.0.0.1:7545"));
      }
        return App.initContract();
        },
        initContract: function() {
            $.getJSON('BuyerSide.json', function(data) {
              // Get the necessary contract artifact file and instantiate it with truffle-contract
              var ShareArtifact = data;
              App.contracts.BuyerSide = TruffleContract(ShareArtifact);
            
              // Set the provider for our contract
              App.contracts.BuyerSide.setProvider(App.web3Provider);
            
              // Use our contract to retrieve and mark the adopted pets
            });
            return App.bindEvents();
          },
          bindEvents: function() {
            $(document).on('click', '#createRFQ', App.handlecreateRFQ);
          },   

        handlecreateRFQ: function(event){
            event.preventDefault();
            var shareInstance;
            var shareName = document.getElementById("shareName").value;
            var shareQuantity = document.getElementById("shareQuantity").value;
            web3.eth.getAccounts(function(error,accounts){
                if(error){
                    console.log(error);
                }
                var account = accounts[0];
                App.contracts.BuyerSide.deployed().then(function(instance){
                    shareInstance = instance;
                    var rfq_id = shareInstance.CreateRFQ(shareName,shareQuantity,{from : account});
                    return rfq_id;
                }).then(function(result){
                    console.log(rfq_id);
                }).catch(function(err){
                    console.log(err.message);
                });  
            });
        }  
};
$(document).ready(function() {
    $(window).on('load', function() {
      App.init();
    });
});