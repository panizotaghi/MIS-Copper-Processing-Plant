# Phase 1: BPMN 2.0 Process Models

The five processes defined in [Phase 0](../Phase_0_Process_Selection) were modeled as **BPMN 2.0** diagrams in **Visual Paradigm**. Each diagram is a pool with one swimlane per role and uses:

- **Typed tasks**: user, manual, service, script, send and receive tasks
- **Exclusive (XOR) gateways** for every decision, plus merge gateways for loops back to earlier steps
- **Start events** with message and conditional triggers, and message end events
- **Intermediate events**: timer, message and conditional (rule) events
- **Data objects** connected with associations (such as the drilling approval document or the failure report)

The Visual Paradigm project is [`BPMN_Models.vpp`](BPMN_Models.vpp). The labels in the original model are in Persian. The images below are English versions rebuilt from the same model file, with the same layout and flows.

| # | Process | Lanes | Tasks | Gateways |
|---|---|---:|---:|---:|
| 1 | Explosives loading | 5 | 7 | 4 |
| 2 | Primary crushing | 5 | 7 | 5 |
| 3 | Inventory control | 4 | 6 | 4 |
| 4 | Sampling of ore, concentrate and copper product | 4 | 5 | 4 |
| 5 | Identifying mechanical downtime | 4 | 7 | 5 |

### 1. Explosives Loading
![Explosives loading BPMN](diagrams/1_explosives_loading.png)

### 2. Primary Crushing
![Primary crushing BPMN](diagrams/2_primary_crushing.png)

### 3. Inventory Control
![Inventory control BPMN](diagrams/3_inventory_control.png)

### 4. Sampling of Ore, Concentrate and Copper Product
![Sampling BPMN](diagrams/4_sampling.png)

### 5. Identifying Mechanical Downtime
![Mechanical downtime BPMN](diagrams/5_mechanical_downtime.png)
