# multi-agent-miners

![g1](https://github.com/njoppi2/multi-agent-miners/assets/16853682/c2cdb701-5abe-4ef5-bcbf-fccc409c3e15)



A multi-agent mining implementation using Jason, made by me and [@IgorMayWensing](https://github.com/IgorMayWensing) for a project of the INE5430 artificial intelligence discipline. For information about Jason, take a look at their [official documentation website](http://jason.sourceforge.net/mini-tutorial/getting-started/).

## 🛠️ Functionalities implemented

- When a robot finds a resource, it notifies
all robots, so they all mine the resource found.
- When a robot notices the current resource is no longer available, it notifies the other robots.
- While searching for a yellow resource, the robots also keep track of green and blue resources they find.
- After they collaborated mining a resource, each robot goes back to their previous location.
- Robots always mine the **found** resources closest to the builder (white square).
  
## 🔎 How it works
We created a flowchart to reduce the number of possible flows
helping in the planning of our program, and thus making the code more
simple.

![g2](https://github.com/user-attachments/assets/cd5984fd-1448-4c9a-9de9-395718f3e991)


The flowchart used is the one in the figure above, with which we were able to make the
code easier to develop and modify. When an agent finds a resource needed, it notifies everyone, including himself, through the belief group_found(R, X, Y, Max). Then executes !check_for_resources, as there is now this new belief, the agent itself who found the resource will enter it, as well as the others who received group_found(R, X, Y, Max) via the tell. Making the same flow of call to the one who **called** and to the one who **was called**. We also made possible to prioritize the resource closest to the boss, using the "Max" in group_found(R, X, Y, Max), created using the .max function:
```java
.max([((X-15)\*\*2)\*\*(1/2),((Y-15)\*\*2)\*\*(1/2)], Max).
```
