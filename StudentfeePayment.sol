// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

//Created a contract Feepayment

contract Feepayment{

    // created Student_Details structure(class)

    struct Student_Details{
        uint256 id;
        string name;
        int amount;
        address wallet_id;
    }

    //Assigned Student_Details to object sd

    Student_Details sd;

    //Used mapping method for amount transcation 

    mapping(address => uint256) public PayAmount;

    //function for giving input

    function Input(uint256 ID,string memory NAME,int AMOUNT,address WALLET_ID) public{

        sd.id = ID;
        sd.name = NAME;
        sd.amount = AMOUNT;
        sd.wallet_id = WALLET_ID;
    }


    //function for displaying output
    function CheckDetails()public view returns(uint256,string memory,int,address){
        return(sd.id,sd.name,sd.amount,sd.wallet_id);
    }


    //used modifier for checking the condition before the function Pay() executes
    modifier check(){

        //checked the condition using require method
        require(msg.sender == sd.wallet_id,"Do check your address");
        _;
    }


    //function for Paying and using payable for transaction
    function Pay()public check payable{

        PayAmount[msg.sender] += msg.value;

    }

    

}
