pos(boss,15,15).
checking_cells.
resource_needed(1).

+my_pos(X,Y) 
   :  building_finished
   <- true.

+my_pos(X,Y) 
   :  checking_cells
   <- .drop_all_desires;
      !check_for_resources.
   
+my_pos(X,Y) 
   :  not checking_cells
   <- true.
 
+!check_for_resources
   :  resource_needed(R) & not found(R) & my_pos(X,Y) & group_found(R, X, Y, Max)
   <- !exclude_resource_belief(R, X, Y, Max);
	  .broadcast(achieve, exclude_resource_belief(R, X, Y, Max));
	  +checking_cells;
	  .drop_all_desires;
	  !check_for_resources.
	  
+!check_for_resources
   :  resource_needed(R) & group_found(R, X, Y, Max)
   <- .findall([M,R,A,B],group_found(R, A, B, M),Available_list); // L unifies with [30,20].
      .sort(Available_list,Sorted);
	  .nth(0,Sorted,First);
	  .nth(2,First,Smallest_X);
	  .nth(3,First,Smallest_Y);
      !mine_and_take_resources(Smallest_X, Smallest_Y);
   	  .drop_all_desires;
      !check_for_resources.

+!check_for_resources
   :  resource_needed(R) & found(R)
   <- !update_group_found(R); // cria o group_found para todos
   	  .drop_all_desires;
	  !check_for_resources.
     
	  
+!check_for_resources
   :  resource_needed(R) & not found(R) & pos(last_searched, X, Y)
   <- !go(last_searched);
	  -pos(last_searched, X, Y);
	  .drop_all_desires;
	  !check_for_resources.
	  
+!check_for_resources
   : found(R) & not resource_needed(R)
   <- !update_group_found(R);
	  .drop_all_desires;
	  .wait(100);
      move_to(next_cell).
	  
+!check_for_resources
   :  resource_needed(R) & not found(R)
   <- +checking_cells;
      .wait(100);
      move_to(next_cell).
		 
+!update_group_found(R)
   :  true
   <- ?my_pos(X,Y);
	  .max([((X-15)**2)**(1/2),((Y-15)**2)**(1/2)],Max);
      +group_found(R, X, Y, Max);
	  .broadcast(tell, group_found(R, X, Y, Max)).

+!mine_and_take_resources(X, Y)
   : true
   <- ?my_pos(X1, Y1);
      +pos(last_searched, X1, Y1);
      !stop_checking(X, Y); // cria "current_resource" e faz -checking_cells.
   	  !go(current_resource);
      !take(R,boss); // leva o minério para o boss
      !continue_mine. // vai pra "current_resource", exclui "current_resource", faz +checking_cells, faz !check_for_resources

		 
+!stop_checking(X, Y) : true
   <- +pos(current_resource,X,Y);
      -checking_cells.

+!take(R,B) : true
   <- .wait(100);
      mine(R);
      !go(B);
      drop(R).

+!continue_mine : pos(current_resource, X, Y)
   <- !go(current_resource);
      -pos(current_resource,X,Y);
      +checking_cells.
	  
+!continue_mine : true
   <- .drop_all_desires;
      !check_for_resources.
	  
+!exclude_resource_belief(R, X, Y, Max)  :  true
   <- .abolish(group_found(R, X, Y, Max));
      .abolish(pos(current_resource, X, Y)).

+!go(Position) 
   :  pos(Position,X,Y) & my_pos(X,Y)
   <- .drop_all_desires;
      true.

+!go(Position) 
   :  Position == current_resource & not pos(current_resource,X,Y) & pos(last_searched,X1,Y1) & resource_needed(R) & group_found(R, X2, Y2, Max)
   <- -pos(last_searched,X1,Y1);
      .drop_all_desires;
	  !check_for_resources.
  
+!go(Position) 
   :  Position == current_resource & not pos(current_resource,X,Y) & pos(last_searched,X1,Y1)
   <- .drop_all_desires;
      !go(last_searched);
      -pos(last_searched,X1,Y1);
	  .drop_all_desires;
	  !check_for_resources.
   
+!go(Position) : true
   <- ?pos(Position,X,Y);
      .wait(100);
      move_towards(X,Y);
      !go(Position).
	  

	  
@psf[atomic]
+!search_for(NewResource) : resource_needed(OldResource)
   <- +resource_needed(NewResource);
      -resource_needed(OldResource).

@pbf[atomic]
+building_finished : true
   <- .drop_all_desires;
      !go(boss).
