# Phase 0: Selecting Key Processes and Initial Modeling

In this phase I picked **five key processes** from different departments of a copper extraction and processing plant and defined each one as a process model: its inputs and outputs, the roles involved (swimlanes), the activities, and the decision gateways. These definitions are the basis of the BPMN 2.0 diagrams in [Phase 1](../Phase_1_BPMN_Modeling).

| # | Process | Department |
|---|---|---|
| 1 | [Explosives loading](#1-explosives-loading) | Mining / extraction |
| 2 | [Primary crushing (jaw crusher)](#2-primary-crushing) | Comminution and sizing |
| 3 | [Inventory control](#3-inventory-control) | Warehouse and materials management |
| 4 | [Sampling of ore, concentrate and copper product](#4-sampling-of-ore-concentrate-and-copper-product) | Quality control and grade monitoring |
| 5 | [Identifying mechanical downtime](#5-identifying-mechanical-downtime) | Downtime and failure management |

Original Persian document: [`Phase0_Report_FA.pdf`](Phase0_Report_FA.pdf)

---

## 1. Explosives Loading

Key process of the **mining (extraction) department**.

| | |
|---|---|
| Department input | Copper-bearing ore (of different grades) |
| Department output | Broken copper ore, ready to be hauled to the comminution unit |
| Process input | Blast holes drilled at the specified points |
| Process output | Completed loading of explosives |

**Swimlanes**

1. **Geology Department**: determines the blast locations and the required amount of explosives.
2. **Blasting Engineering Team**: designs the blast and confirms its safety.
3. **Explosives Loading Operator**: carries out the loading.
4. **Safety & Environmental Team**: supervises and assesses risk.
5. **Operations Supervisor**: gives final approval to start the blast.

**Process flow**

1. **Start event**: drilling approval and loading plan received.
2. **Geological assessment**: the Geology Department determines the blast points and the volume of explosives needed.
3. **Blasting design**: the Blasting Engineering Team designs the blast and issues the blast plan.
   - *Gateway: Is the blast design approved?* No → the design is revised. Yes → go to the safety check.
4. **Safety check**: the Safety & Environmental Team reviews the risks and issues safety approval.
   - *Gateway: Is safety approved?* No → back to blasting design. Yes → continue.
5. **Transporting explosives**: the operator moves the explosives to the site.
6. **Loading explosives**: the operator loads the blast holes according to the design.
7. **Final safety inspection**: the Safety Team and the Operations Supervisor check the safety and correctness of the loading.
8. **Ready for blast**: the Operations Supervisor gives the final check before the blast.
   - *Gateway: Has the Operations Supervisor given final approval?* No → back to the relevant earlier step, depending on the reason. Yes → end.
9. **End event**: loading completed and the site is ready for blasting.

---

## 2. Primary Crushing

Key process of the **comminution and sizing department**: reducing rock size with a jaw crusher.

| | |
|---|---|
| Department input | Run-of-mine ore in large sizes |
| Department output | Crushed particles of a suitable size for grinding |
| Process input | Run-of-mine ore in large sizes |
| Process output | Smaller ore, ready for secondary crushing |

**Swimlanes**

1. **Process Engineering Team**: designs and controls the operating parameters.
2. **Crusher Operator**: runs the primary crushing.
3. **Safety & Environmental Team**: makes sure safety and environmental requirements are met.
4. **Maintenance Team**: prepares the equipment and monitors its condition.
5. **Operations Supervisor**: gives final approval and hands the material over to the next stage.

**Process flow**

1. **Start event**: run-of-mine ore arrives at the crusher.
2. **Equipment check**: the Maintenance Team inspects and approves the jaw crusher.
   - *Gateway: Is the crushing equipment ready?* No → maintenance is carried out. Yes → continue.
3. **Crusher parameter setup**: the Process Engineering Team sets the operating parameters (such as jaw gap and power).
   - *Gateway: Are the operating parameters correct?* No → readjust. Yes → continue.
4. **Load rocks into crusher**: the operator feeds the ore into the crusher.
5. **Initiate crushing**: the operator starts the machine.
6. **Monitor crusher performance**: the control group of the Process Engineering Team monitors the machine.
7. **Quality check of output**: the Process Engineering Team checks the size and quality of the crushed particles.
   - *Gateway: Is the output particle size acceptable?* No → review the crusher settings. Yes → continue.
8. **Data logging and reporting**: the Operations Supervisor records the process data and prepares the final report.
9. **End event**: primary crushing is complete and the crushed ore is ready for secondary crushing.

---

## 3. Inventory Control

Key process of the **warehouse and materials management department**: preventing stock shortages and overstocking.

| | |
|---|---|
| Department input | Raw materials, semi-finished and finished products |
| Department output | Well-managed and optimized inventory |
| Process input | All stored products and materials |
| Process output | Optimized inventory, with no shortages or overstocking |

**Swimlanes**

1. **Warehouse Management Team**: monitors and updates stock levels.
2. **Procurement Team**: arranges the supply of required materials and products.
3. **Sales & Production Planning Team**: provides demand forecasts and production plans.
4. **Quality Control Team**: checks the quality of materials and products.
5. **Warehouse Operations Supervisor**: gives final approval and coordinates warehouse operations.

**Process flow**

1. **Start event**: the current stock level is recorded in the system.
2. **Inventory assessment**: the Warehouse Management Team reviews stock levels in the system.
3. **Demand analysis**: the Sales & Production Planning Team provides demand forecasts and future needs.
4. **Min/max inventory check**: the Warehouse Management Team compares stock with the defined minimum and maximum levels.
   - *Gateway: Is stock at the minimum level?* No → record and update the current level. Yes → place a new order.
   - *Gateway: Has stock exceeded the maximum level?* No → record and update the current level. Yes → transfer material to other warehouses or change the production plan.
5. **Procurement or transfer coordination**: the Procurement Team arranges new orders or transfers between warehouses.
6. **Quality inspection**: the Quality Control Team inspects and approves incoming materials.
   - *Gateway: Is the quality of the new material acceptable?* No → return the material or take corrective action, then go back to procurement/transfer coordination. Yes → continue.
7. **Inventory update**: the Warehouse Management Team records the new stock status.
8. **End event**: inventory control completed and the optimized status recorded in the system.

---

## 4. Sampling of Ore, Concentrate and Copper Product

Key process of the **quality control and copper grade monitoring department**.

| | |
|---|---|
| Department input | Samples of raw materials, semi-finished and finished products |
| Department output | Accurate information on product purity and quality |
| Process input | Samples of raw materials, semi-finished and finished products |
| Process output | Selected samples, ready to be sent to the laboratory |

**Swimlanes**

1. **Production Team**: sends materials and products to sampling.
2. **Quality Control Team**: carries out sampling and the initial inspection.
3. **Assay Laboratory**: performs the initial analysis of samples.
4. **Quality Supervisor**: approves and reports the sampling and approves sending samples to the main laboratory.

**Process flow**

1. **Start event**: a sampling request for ore, concentrate or copper product is received.
2. **Sample transfer**: the Production Team sends the samples to the Quality Control Team.
3. **Initial sample inspection**: the Quality Control Team checks the physical condition of the samples.
   - *Gateway: Are the samples in acceptable physical condition?* No → samples are replaced (back to the sampling request). Yes → continue.
4. **Precise sampling**: the Quality Control Team takes samples from the specified points.
   - *Gateway: Was precise sampling successful?* No → samples are replaced (back to the sampling request). Yes → continue.
5. **Send to laboratory**: samples go to the assay laboratory for initial approval.
6. **Review and approve results**: the Quality Supervisor reviews the results and approves sending the samples to the main laboratory for chemical testing.
   - *Gateway: Are the final sampling results approved?* No → resample (back to the sampling request). Yes → end.
7. **End event**: sampling completed and samples sent to the laboratory with full information.

---

## 5. Identifying Mechanical Downtime

Key process of the **downtime and failure management department** (failures of crushers, mills and smelting furnaces).

| | |
|---|---|
| Department input | Failure reports and equipment performance data |
| Department output | Less downtime and higher productivity |
| Process input | Failure reports and equipment performance data |
| Process output | Identified mechanical stoppages |

**Swimlanes**

1. **Equipment Operator**: monitors equipment and records initial stoppages.
2. **Maintenance Team**: reviews reports and carries out corrective actions.
3. **Data Analysis Team**: analyzes equipment performance data and finds failure patterns.
4. **Operations Supervisor**: approves and follows up the proposed actions to reduce downtime.

**Process flow**

1. **Start event**: an equipment failure or stoppage report is received.
2. **Record downtime**: the operator logs the stoppage or failure in the system.
3. **Prioritize and assign reports**: the Maintenance Team classifies reports by severity and importance.
   - *Gateway: Is the recorded failure urgent?* Yes → immediate repair. No → added to the prioritized repair list.
4. **Initial equipment inspection**: the Maintenance Team inspects the equipment, finds the cause of the stoppage and then repairs it.
5. **Analyze performance data**: the Data Analysis Team analyzes performance and failure data.
6. **Identify root causes**: the Data Analysis and Maintenance teams determine the root causes.
   - *Gateway: Has the root cause been identified?* No → go back to performance data analysis for a closer look. Yes → continue.
7. **Propose corrective actions**: actions to reduce downtime are proposed to the Operations Supervisor.
8. **Implement corrective actions**: the Maintenance Team carries out the approved actions.
   - *Gateway: Were the corrective actions successful?* No (failure rates did not improve) → go back to root-cause identification. Yes → end.
9. **End event**: mechanical stoppages identified, downtime reduced and equipment productivity increased.
