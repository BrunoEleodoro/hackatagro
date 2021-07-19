pragma solidity >=0.4.22 <0.7.0;
pragma experimental ABIEncoderV2;

contract Rusticos {
    
    struct Produto {
        address key;
        Action[] actions;
    }
    
    struct Action {
        address agricultor;
        string title;
        string description;
        string date;
    }
    
    mapping (address => Produto) private historico;
    
    function performAction(address produto, string memory title, string memory description, string memory date) public returns (bool) {
        historico[produto].actions.push(Action(msg.sender, title, description, date));
        return true;
    }
    
    function getHistorico(address produto) public view returns (Action[] memory) {
        return historico[produto].actions;
    }
    
    
    
}