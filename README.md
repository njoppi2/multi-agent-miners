# Multi-Agent Miners

[![CI](https://img.shields.io/github/actions/workflow/status/njoppi2/multi-agent-miners/ci.yml?branch=master&label=CI)](https://github.com/njoppi2/multi-agent-miners/actions/workflows/ci.yml)
[![License](https://img.shields.io/github/license/njoppi2/multi-agent-miners)](LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/njoppi2/multi-agent-miners)](https://github.com/njoppi2/multi-agent-miners/commits/master)

Academic multi-agent mining project built with **Jason** for the INE5430 AI course, co-developed with [@IgorMayWensing](https://github.com/IgorMayWensing).

## Snapshot

<p align="center">
  <img src="https://github.com/njoppi2/multi-agent-miners/assets/16853682/c2cdb701-5abe-4ef5-bcbf-fccc409c3e15" alt="Multi-agent miners simulation board with agents and resources" width="720" />
</p>

## Problem

Coordinate multiple agents to discover, share, prioritize, and mine distributed resources using collaborative beliefs and plans.

## Tech Stack

- Jason (AgentSpeak)
- Java / Ant tooling
- Bash helper scripts

## Repository Layout

Project-specific files are mainly:

- `projetos/semincoMineradores/semincoMineradores.mas2j`
- `projetos/semincoMineradores/src/asl/col.asl`
- `projetos/semincoMineradores/src/asl/builder.asl`

The repository also includes Jason runtime and examples.

## Implemented Behaviors

- Global broadcast of discovered resources
- Global broadcast of resource depletion updates
- Local cache of non-target resources while searching
- Return-to-search-position after collaborative mining
- Priority ordering based on distance to builder

## Quickstart

From repository root:

```bash
./scripts/jason projetos/semincoMineradores/semincoMineradores.mas2j
```

Alternative:

```bash
cd projetos/semincoMineradores
ant -f bin/build.xml run
```

## Validation and CI

Local checks:

```bash
bash -n scripts/jason
bash -n scripts/jason-setup
bash -n scripts/jason-ide
bash -n scripts/jason-new-project
bash -n scripts/mas2j
python -m unittest discover -s tests -p "test_*.py"
```

CI (`.github/workflows/ci.yml`) validates key project files, helper script shell syntax, and scenario assertions for coordination plans.

## Results

- Shared coordination belief (`group_found(...)`) is integrated into team behavior.
- Agents coordinate candidate resources with consistent shared priority.
- Repository has baseline CI sanity coverage for critical project files/scripts.

## Limitations

- Repo includes framework/vendor assets, increasing footprint.
- No automated simulation assertions for behavior outcomes yet.
- Evaluation is still mostly qualitative/manual.

## Roadmap

- Add reproducible scenarios with expected cooperative outcomes.
- Add automated scenario assertions for project-specific ASL plans.
- Split or slim vendor/framework assets from project logic.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).
