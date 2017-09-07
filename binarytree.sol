pragma solidity ^0.4.0;
 contract Coins
{
function Coins()
{
    head=0;
    ind_xy=0;
    ind=1;
    Btree[0].left=0;
    Btree[0].right=0;
}
     struct Node 
    {
     uint key;
     uint left;
     uint right;
     uint[10] y_arr;
     uint index; 
     }
uint[100] public x;
uint ind_xy;
uint[100] public y;
Node[100] public Btree;
uint public head;
uint public ind;

function max(int a, int b) returns (int)
{
return (a > b)? a : b;
}
function search_x(uint r, uint key,uint key_y) returns (uint)
{
  if(Btree[r].key==key)
  {
      for(uint i=0;i<Btree[r].index;i++)
      {
          if(Btree[r].y_arr[i]==key_y)
          return r;
      }
      return 0;
  }
  else if(Btree[r].key>key)
  {
      if(Btree[r].left!=0)
      return search_x(Btree[r].left,key,key_y);
      else return 0;
  }
  else
   {
      if(Btree[r].right!=0)
      return search_x(Btree[r].right,key,key_y);
      else return 0;
   }
}
function search_y(uint r, uint key,uint key_y) returns (uint)
{
  if(Btree[r].key==key)
  {
      for(uint i=0;i<Btree[r].index;i++)
      {
          if(Btree[r].y_arr[i]==key_y)
          return i;
      }
      return 0;
  }
  else if(Btree[r].key>key)
       {
      if(Btree[r].left!=0)
      return search_x(Btree[r].left,key,key_y);
      else return 0;
       }
  else
  {
      if(Btree[r].right!=0)
      return search_y(Btree[r].right,key,key_y);
      else return 0;
  }
}
function sear(uint r,uint key) returns (uint)
{
        for(;;)
{
if (key < Btree[r].key)
{
if(Btree[r].left==0)
{
  return r;
}
else
r=Btree[r].left;
}
else if (key > Btree[r].key)
{
    if(Btree[r].right==0)
    {
   return r;
    }
else
    r=Btree[r].right;
}
else {
    return r;
}
}
}
function insert(uint r, uint key,uint key_y) 
{
if (head==0)
{
    Btree[ind].key=key;
    Btree[ind].left=0;
    Btree[ind].right=0;
    Btree[ind].y_arr[Btree[ind].index]=key_y;
    Btree[ind].index=Btree[ind].index+1;
    head=1;
}
else
{
if (key < Btree[r].key)
{
    ind=ind+1;
    Btree[r].left=ind;
    Btree[ind].left=0;
    Btree[ind].right=0;
    Btree[ind].key=key;
    Btree[ind].y_arr[Btree[ind].index]=key_y;
    Btree[ind].index=Btree[ind].index+1;
}
else if (key > Btree[r].key)
{
    ind=ind+1;
    Btree[r].right=ind;
    Btree[ind].left=0;
    Btree[ind].right=0; 
    Btree[Btree[r].right].key=key;
    Btree[ind].y_arr[Btree[ind].index]=key_y;
    Btree[ind].index=Btree[ind].index+1;
}
else {
    Btree[r].y_arr[Btree[r].index]=key_y;
    Btree[r].index=Btree[r].index+1;
}

}
return;
}
function push_y(uint x_x,uint y1,uint y2)
{
   for(uint i=0;i<Btree[x_x].index;i++)
   {
       if(Btree[x_x].y_arr[i]<=y2&& Btree[x_x].y_arr[i]>=y1)
        {
            x[ind_xy]=Btree[x_x].key;
            y[ind_xy++]=Btree[x_x].y_arr[i];
        }
   }
}
function searchlist(uint root,uint x1,uint x2,uint y1,uint y2) 
{
    uint r_k=Btree[root].key;
     if(Btree[root].left==0 &&Btree[root].right==0&& r_k==0)
       return;
    if(r_k>x2 && r_k>x1)
         searchlist(Btree[root].left,x1,x2,y1,y2);
    else if(r_k<x2 && r_k<x1)
         searchlist(Btree[root].right,x1,x2,y1,y2);
    else if(r_k>=x1&& r_k<=x2)
    {
        push_y(root,y1,y2);
        searchlist(Btree[root].left,x1,x2,y1,y2);
        searchlist(Btree[root].right,x1,x2,y1,y2);
    }
}
 function deletenode(uint root,uint key) returns (uint)
      {
             if(Btree[root].key==key)
             {
                uint x=root;
               if(Btree[x].left==0&&Btree[x].right==0)
              {
                Btree[x].key=0;
                return 0;
              }
              else if(Btree[x].left==0)
              {
                  Btree[x].key=Btree[Btree[x].right].key;
                  Btree[x].index=Btree[Btree[x].right].index;
                  for(uint i=0;i<Btree[Btree[x].right].index;i++)
                  {
                       Btree[x].y_arr[i]= Btree[Btree[x].right].y_arr[i];
                  }
                  Btree[x].right=deletenode(Btree[x].right,Btree[Btree[x].right].key);
              }
               else 
              {
                  Btree[x].key=Btree[Btree[x].left].key;
                  Btree[x].index=Btree[Btree[x].left].index;
                  for(uint j=0;j<Btree[Btree[x].left].index;j++)
                  {
                       Btree[x].y_arr[j]= Btree[Btree[x].left].y_arr[j];
                  }
                  Btree[x].left=deletenode(Btree[x].left,Btree[Btree[x].left].key);
              }  
             }
             else if(Btree[root].key>key)
             Btree[root].left=deletenode(Btree[root].left,key);
             else
             Btree[root].right=deletenode(Btree[root].right,key);
          
      }
 function deletekey(uint root,uint key,uint key_y) returns(uint)
      {
          uint x=search_x(root,key,key_y);
          uint y=search_y(root,key,key_y);
          if(x==0)
            return 0;
          else
          {
              if(Btree[x].index==1)
              {
                deletenode(root,key);
              }
              else
              {
                for(uint i=y;i<Btree[x].index-1;i++)
                {
                    Btree[x].y_arr[i]=Btree[x].y_arr[i+1];
                }
                 Btree[x].index--;
              }
              return x;
          }
      }
function minValueNode(uint root) returns (uint)
{
uint current = root;
while (Btree[current].left != 0)
current =Btree[current].left;

return Btree[current].key;
}
}