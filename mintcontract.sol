pragma solidity 0.5.1;

contract mintYourCoins {
    address public minter;
    mapping(address => uint) public balance;

    event Sent(address from, address to, uint amount);

    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount <1e60);
        balance[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balance[msg.sender], "Insufficient balance");
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

    function balances(address _account) external view returns (uint) {
        return balance[_account];
    }
}
