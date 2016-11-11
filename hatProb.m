win=0;
Pass=0;
for i=1:100
    
 prize=randi(3);
 doors=[0 0 0];
 
 pick=Monty(doors);
 
 pick=floor(pick);
 if pick<1 || pick>3
  win=0;
  break;
 else
  doors(pick)=1;
 end
 
 if pick==prize
 % Random select from other doors
  if rand>0.5
   doors(find(doors==0,1))=2;
  else
   doors(find(doors==0,1,'last'))=2;
  end
 else % 
 % Pick other and not prize door
  reveal=setxor(prize,setxor(pick,[1 2 3]));
  doors(reveal)=2;
 end
 
 pick=Monty(doors);
 pick=floor(pick);
 if pick==prize
  win=win+1;
 end
 
 
end % Monty Loops
win % Display number of wins
if win>50,Pass=1;end
assert(isequal(Pass,1))