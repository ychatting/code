pragma solidity >=0.4.22 <0.6.0;

library hitung {
    function add(uint a, uint b) internal pure returns (uint c) {
         c = a + b;
         require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require( a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
         require(b > 0);
         c = a / b;
    }
}
 contract Owned {
     address public owner;
     address public newOwner;
     
     event OwnershipTransferred(address indexed _from, address indexed _to);
     
     constructor() public {
         owner = msg.sender;
     }
     
     modifier onlyOwner {
         require(msg.sender == owner);
         _;
     }
     
     function transferOwnership(address _newOwner) public onlyOwner {
         newOwner = _newOwner;
     }
     function acceptOwnership() public {
     require(msg.sender == newOwner);
     emit OwnershipTransferred(owner, newOwner);
     newOwner = address(0);
     }
 }
 
 contract CHAT {
     function totalSupply() public view returns (uint);
     function balanceOf(address tokenOwner) public view returns (uint balance);
     function allowance(address tokenOwner, address spender) public view returns (uint remaining);
     function transfer(address to, uint tokens) public returns (bool success);
     function approve(address spender, uint tokens) public returns (bool success);
     function transferFrom(address from, address to, uint tokens) public returns (bool success);
     
     event Transfer(address indexed from, address indexed to, uint tokens);
     event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
 }
 
 contract DetailToken is CHAT, Owned {
     using hitung for uint;
     string public symbol;
     string public name;
     uint8 public decimals;
     uint _totalSupply;
     
     mapping(address => uint) balances;
     mapping(address => mapping(address => uint)) allowed;
     
     
         constructor() public {
         symbol = "CHAT";
         name = "CHAT TOKEN";
         decimals = 18;
         _totalSupply = 55000000 * 10**uint(decimals);
         balances[0xAa66fC4433DFD254F05A720A8c8a2f1F2fbDCB58] = _totalSupply;
         emit Transfer(address(0), 0xAa66fC4433DFD254F05A720A8c8a2f1F2fbDCB58, _totalSupply);
}
