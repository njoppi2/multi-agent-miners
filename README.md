# multi-agent-miners

![image](https://user-images.githubusercontent.com/16853682/185815346-86747639-6efc-4b30-bb16-5013a489df4c.png)


A multi agent mining implementation using Jason, made by me and [@IgorMayWensing](https://github.com/IgorMayWensing). For information about Jason, take a lot at their [official documentaion website](http://jason.sourceforge.net/mini-tutorial/getting-started/).

## How it works
We created a flowchart to reduce the number of possible flows
helping in the planning of our program, and thus making the code more
simple.

![fluxMA](https://user-images.githubusercontent.com/16853682/185812865-626b5b31-93af-46a4-98e4-44637d157182.png)


The flowchart used is the one in the figure above, with which we were able to make the
code easier to develop and modify. When an agent finds a resource needed, it notifies everyone, including himself, through the belief group_found(R, X, Y, Max). Then executes !check_for_resources, as there is now this new belief, the agent itself who found the resource will enter it, as well as the others who received group_found(R, X, Y, Max) via the tell. Making the same flow of call to the one who **called** and to the one who **was called**. We also made possible to prioritize the resource closest to the boss, using the "Max" in group_found(R, X, Y, Max), created using the .max function:
```java
.max([((X-15)\*\*2)\*\*(1/2),((Y-15)\*\*2)\*\*(1/2)], Max).
```