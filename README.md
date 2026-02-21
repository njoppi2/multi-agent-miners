# Multi-Agent Miners

Academic multi-agent mining project built with **Jason** for the INE5430 AI course, co-developed with [@IgorMayWensing](https://github.com/IgorMayWensing).

![g1](https://github.com/njoppi2/multi-agent-miners/assets/16853682/c2cdb701-5abe-4ef5-bcbf-fccc409c3e15)

## What Is Project-Specific Here

This repository contains a full Jason distribution plus examples.  
The project-specific code for this work is mainly under:

- `projetos/semincoMineradores/semincoMineradores.mas2j`
- `projetos/semincoMineradores/src/asl/col.asl`
- `projetos/semincoMineradores/src/asl/builder.asl`

## Implemented Behaviors

- Miners broadcast newly found resources to the whole team.
- Miners broadcast depletion updates when a resource is no longer available.
- Agents cache non-target resources while searching for the current required one.
- Agents return to previous search positions after collaborative mining.
- Group prioritization favors resources closer to the builder.

## Coordination Strategy

The core coordination belief is:

`group_found(ResourceType, X, Y, Priority)`

Agents:

- publish discoveries with `.broadcast(tell, group_found(...))`,
- maintain shared candidate sets,
- and coordinate movement/mining through plans such as `!check_for_resources` and `!mine_and_take_resources`.

Priority is derived from distance to the builder position, allowing consistent shared ordering of candidate resources.

## Running the Project

From repository root:

```bash
./scripts/jason projetos/semincoMineradores/semincoMineradores.mas2j
```

Alternative (from the project folder):

```bash
cd projetos/semincoMineradores
ant -f bin/build.xml run
```

## Notes

- This is an educational project focused on multi-agent coordination logic.
- The repository includes third-party Jason runtime assets and examples for convenience.

## Next Improvements

- Add reproducible experiment scenarios with expected outcomes for each cooperative strategy.
- Add automated scenario assertions for project-specific plans under `projetos/semincoMineradores`.
- Split framework/vendor assets from project-specific code to reduce repository footprint.

## Reference

Jason docs: <http://jason.sourceforge.net/mini-tutorial/getting-started/>
