package jason.stdlib;

import jason.asSemantics.InternalAction;
import jason.asSemantics.TransitionSystem;
import jason.asSemantics.Unifier;
import jason.asSyntax.Term;

/**
  <p>Internal action: <b><code>.df_deregister(S [,T])</code></b>.

  <p>Description: removes the agent in the Directory Facilitator as a provider of service S of type T (see FIPA specification).
    An optional second argument can be used to define the type of the service.

  <p>Examples:<ul>
  <li> <code>.df_deregister("sell(book)")</code>: deregister the agent as a book seller.
  </ul>

  @see jason.stdlib.df_register
  @see jason.stdlib.df_search
  @see jason.stdlib.df_subscribe

 */
public class df_deregister extends df_register {

    private static InternalAction singleton = null;
    public static InternalAction create() {
        if (singleton == null)
            singleton = new df_deregister();
        return singleton;
    }

    @Override public int getMinArgs() {
        return 1;
    }
    @Override public int getMaxArgs() {
        return 2;
    }

    @Override
    public Object execute(final TransitionSystem ts, Unifier un, Term[] args) throws Exception {
        checkArguments(args);
        ts.getUserAgArch().getRuntimeServices().dfDeRegister(ts.getUserAgArch().getAgName(), getService(args), getType(args));
        return true;
    }
}
