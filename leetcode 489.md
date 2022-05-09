# Leetcode 489 Robot Room Cleaner


We can assume our start point is (0,0)
This question is the classic sweeping robot topic, before often in the ground to see this question, 
finally was LeetCode collected in, but also finally found a good home. Back to the topic, we are given 
a sweeping robot, given four API functions to call, the specific implementation does not have to worry about, 
let us implement the cleanRoom function to clean the room. The example given has information about the room and 
the starting position, but the code does not, clearly not wanting us to be distracted. Think about it, do you have to 
know the user's room information when programming a floor cleaning robot? Of course not, the title also says to blind 
Blindfolded some, so just write blindly. Since it is sweeping, then we must record which locations have been 
swept, so we must record the location information, because we do not know the global location, so we can only 
use the relative location information. Initially, it is (0, 0), and then up and down plus or minus 1 can be. 
The location information can be placed in a HashSet, and for convenience, the two-dimensional coordinates can 
be encoded into a string. Here we use recursive DFS to do this, initialize the position to (0, 0), then build a
directional array of up, down, left and right, and use a variable dir to take the numbers from it. In the recursive 
function, the clean function is first called on the starting position, because the title says that the starting position 
is the one that can be reached, i.e., the place where 1 is. Then the starting position is added to visited, and then 
it is looped four times, because there are four directions, because the dir passed in by the recursive function is 
the direction of the last turn, so at this time dir plus i, in order to prevent crossing the boundary, take the 
remainder of 4, which is the new direction, and then calculate the new position coordinates newX and newY. At this 
time, we must first determine that visited does not contain this new position, that is, the new position has not 
been visited. If these two conditions are met, the recursive function is called on the new position. Note that 
after the recursive function is called, it has to return to the state before the call, because the robot here 
has a reference number and is globally common, so it has to return to the previous state. Returning to the 
previous state is simple, because the robot here works by turning to the direction it wants to go before it 
can go forward. So the way to go back is to rotate 180 degrees, take a step forward, and then turn back to 
the original direction. Similarly, when trying up->right->down->left in sequence, each time the robot has to 
turn to the right a bit, because the move function can only detect whether the front is reachable, so you 
have to let the robot turn to the right direction in order to call the move function correctly. If you 
have used a sweeping robot, you will be affected by the fact that when there is an obstacle in front 
of you, the robot disc will first turn in a direction and then move on.

```cpp
/**
 * // This is the robot's control interface.
 * // You should not implement it, or speculate about its implementation
 * class Robot {
 *   public:
 *     // Returns true if the cell in front is open and robot moves into the cell.
 *     // Returns false if the cell in front is blocked and robot stays in the current cell.
 *     bool move();
 *
 *     // Robot will stay in the same cell after calling turnLeft/turnRight.
 *     // Each turn will be 90 degrees.
 *     void turnLeft();
 *     void turnRight();
 *
 *     // Clean the current cell.
 *     void clean();
 * };
 */

class Solution {
public:
    void cleanRoom(Robot& robot) {
        
        set<pair<int,int> >vis;
        dfs(0,0,0,robot,vis);
    }
private:
    
    void dfs(int x,int y,int di,Robot&rt,set<pair<int,int> >&vis){
        if (vis.count(make_pair(x,y))) return;
        vis.insert(make_pair(x,y));
        rt.clean();int dir=di;
        for (int k=0;k<4;++k){
            int x_to=x,y_to=y;
            di=(dir+k)%4;
            if (rt.move()){
                switch(di){
                    case 0:x_to-=1;break;
                    case 1:y_to+=1;break;
                    case 2:x_to+=1;break;
                    case 3:y_to-=1;break;
                }
                dfs(x_to,y_to,di,rt,vis);
                // let the robot to go back
                rt.turnRight();
                rt.turnRight();
                rt.move();

                // redict to the original direction
                rt.turnRight();
                rt.turnRight();
            }
            rt.turnRight();
            
            
        }
    }
};
```
