# PLC Conveyor Control System

A basic conveyor motor control system using PLC ladder logic with industrial safety features.

## Core Features
- Start/Stop control with seal-in (latching) logic
- Emergency stop with safe restart
- Timed auto-shutdown
- Fault handling (E-stop, operator stop, timer expiry)

## How It Works
```
Start -> Motor runs -> Seal-in maintains -> Timer counts -> Auto-stop
```

## SQL Analytics (AdventureWorks2022)
Sales & operational analysis including:
- Top sales reps & product revenue
- Customer AOV & order trends
- Employee distribution & revenue concentration

