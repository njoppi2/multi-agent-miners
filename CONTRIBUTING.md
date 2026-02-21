# Contributing

## Setup

Run the project with:

```bash
./scripts/jason projetos/semincoMineradores/semincoMineradores.mas2j
```

## Before Opening a PR

Run:

```bash
bash -n scripts/jason
bash -n scripts/jason-setup
bash -n scripts/jason-ide
bash -n scripts/jason-new-project
bash -n scripts/mas2j
python -m unittest discover -s tests -p "test_*.py"
```

## Pull Request Guidelines

- Keep contributions focused on project-specific logic under `projetos/semincoMineradores`.
- Update `README.md` when behavior/running instructions change.
- Describe scenario impact and how behavior was verified.
- Do not commit local/generated environment artifacts.
