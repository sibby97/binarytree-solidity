pragma solidity ^0.4.10;
contract Tree{
  
	struct Node{
		uint data;
		uint left;
		uint right;
	}
 
    Node[100] public nodes;
   
    uint public ind;
    
	uint public head ;
	
	  function Tree(){
        head = 100;
        ind = 0;
    }
    
	function binaryTree(uint dat, uint temphead){
	    if(head == 1)
	    {
			if(dat < nodes[temphead].data){
				if(nodes[temphead].left != 100){
					binaryTree(dat,nodes[temphead].left);
				}
				else{
        			ind++;
                    nodes[temphead].left = ind;
                    nodes[ind].data = dat;
                    nodes[ind].left = 100;
                    nodes[ind].right = 100;
				}
			}
			else{
				if(nodes[temphead].right != 100){
					binaryTree(dat,nodes[temphead].right);
				}
				else{
        		    ind++;
                    nodes[temphead].right = ind;
                    nodes[ind].data = dat;
                    nodes[ind].left = 100;
                    nodes[ind].right = 100;
				}
			}
	    }
	    else{
	        nodes[ind].data = dat;
	        nodes[ind].left = 100;
	        nodes[ind].right = 100;
	        head = 1;
	    }
	}

	function count() constant returns (uint){
	    return ind;
	}
	
	function search(uint x,uint temphead) returns (uint index){
	    uint i;
	    if(head == 0){
	        throw;
	    }
	    if(nodes[temphead].data == x){
	        return temphead;
	    }
	    if(x < nodes[temphead].data){
	        i = search(x,nodes[temphead].left);
	        return i;
	    }
	    else {
	        i = search(x,nodes[temphead].right);
	        return i;
	    }
	}
}