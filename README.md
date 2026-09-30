# Management Information System for a Copper Processing Plant

An end-to-end **Management Information System (MIS)** project for a copper extraction and processing plant, built in four phases: from selecting and defining key business processes, to **BPMN 2.0** process models, a relational **SQL Server** database with analytical queries, and an interactive **Power BI** dashboard with KPIs.

- **Instructor:** Dr. Hadi Mosadegh
- **Course:** Management Information Systems (MIS)
- **Department:** Industrial Engineering, Amirkabir University of Technology (Tehran Polytechnic)
- **Author:** Paniz Otaghi
- **Term:** Spring 2025

All data in this project is synthetic and was generated for the course.

## Project structure

```text
Phase 0 ─► Process selection and definition   (5 key processes, roles, activities, decision points)
   │
Phase 1 ─► BPMN 2.0 modeling                   (Visual Paradigm: pools, lanes, typed tasks, events, gateways)
   │
Phase 2 ─► Dataset, ERD and SQL Server         (10 tables, PK/FK design, 14 T-SQL queries)
   │
Phase 3 ─► Power BI dashboard                  (Power Query, DAX, 4 report pages, KPIs)
```

| Phase | Folder | Highlights |
|---|---|---|
| 0 | [Process Selection](Phase_0_Process_Selection) | Explosives loading, primary crushing, inventory control, quality sampling and mechanical downtime, each with inputs/outputs, swimlanes, activities and gateways |
| 1 | [BPMN Modeling](Phase_1_BPMN_Modeling) | Five BPMN 2.0 diagrams with user/manual/service/script/send/receive tasks, XOR gateways and timer, message and conditional events |
| 2 | [Database and SQL](Phase_2_Database_and_SQL) | Synthetic dataset built in Excel (10 tables, ~150 records each), three-step ERD, SQL Server schema with 1:1 and 1:N relationships, 14 analytical queries using window functions and subqueries |
| 3 | [Power BI Dashboard](Phase_3_Power_BI_Dashboard) | Chemical analysis, units and shifts, and product/destination pages, a drill-through page, and KPIs for successful tests, urgent shifts and monthly sales |

## Preview

**BPMN model: primary crushing**

![Primary crushing BPMN](Phase_1_BPMN_Modeling/diagrams/2_primary_crushing.png)

**Power BI: chemical analysis page**

![Chemical analysis dashboard](Phase_3_Power_BI_Dashboard/screenshots/page1_chemical_analysis.png)

## Key results

- **Chemical testing:** 80 successful vs. 71 unsuccessful tests. The target of 15 successful tests per month was missed only in March and May. Conductivity tests have the highest success rate and pH the lowest.
- **Shifts:** shifts A, B and C have almost the same average efficiency (about 64–65%). The limit of fewer than 15 urgent shifts per month was met in two of five months, improving toward the end of the period.
- **Sales:** products 1 and 3 sell the most and destinations 7 and 8 buy the most. Monthly sales moved above the target of 60 in April and May, together with higher material recovery.

## Tools

- **Process modeling:** Visual Paradigm (BPMN 2.0)
- **Data generation:** Microsoft Excel
- **Data modeling:** draw.io (ERD)
- **Database:** Microsoft SQL Server, SQL Server Management Studio, T-SQL
- **Business intelligence:** Power BI Desktop, Power Query, DAX

## Language note

The original deliverables were written in Persian and are kept in each phase folder (files ending in `_FA`). The reports, BPMN diagrams, dataset, schema and queries in this repository are English translations. The SQL Server and Power BI screenshots, and the `.pbix` file, show the original Persian labels.
