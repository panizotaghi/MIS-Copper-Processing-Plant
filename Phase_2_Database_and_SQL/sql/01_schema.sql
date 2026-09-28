/* =====================================================================
   Copper Processing Plant MIS - relational schema (Microsoft SQL Server)
   10 tables, primary/foreign keys and 1:1 relationships from the final ERD.
   Column names are the English equivalents of the original Persian columns.
   ===================================================================== */

CREATE TABLE ProcessUnit (
    UnitID               INT            NOT NULL PRIMARY KEY,
    UnitName             NVARCHAR(100)  NOT NULL,
    UnitType             NVARCHAR(50)   NOT NULL,
    CapacityTonsPerHour  INT            NOT NULL,
    EfficiencyPercent    INT            NOT NULL,
    MachineCount         INT            NOT NULL
);

CREATE TABLE MaterialFlow (
    MaterialFlowID  INT           NOT NULL PRIMARY KEY,
    MaterialType    NVARCHAR(50)  NOT NULL,           -- Feed, Concentrate, Tailings, Return
    Weight          INT           NOT NULL,
    [Date]          DATE          NOT NULL,
    WastePercent    INT           NOT NULL,
    InputType       BIT           NOT NULL,           -- 0 = primary, 1 = secondary
    UnitID          INT           NOT NULL,       -- many-to-one
    CONSTRAINT FK_MaterialFlow_ProcessUnit FOREIGN KEY (UnitID) REFERENCES ProcessUnit(UnitID)
);

CREATE TABLE ShiftReport (
    ReportID            INT          NOT NULL PRIMARY KEY,
    ReportDate          DATE         NOT NULL,
    ReportTime          TIME(0)      NOT NULL,
    ShiftCode           CHAR(1)      NOT NULL CHECK (ShiftCode IN ('A', 'B', 'C')),
    ShiftDurationHours  INT          NOT NULL,
    StaffCount          INT          NOT NULL,
    IsUrgentShift       BIT          NOT NULL,        -- 1 = urgent (emergency) shift
    ShiftEfficiency     INT          NOT NULL,        -- percent
    ReportingUnit       INT          NOT NULL,
    UnitID              INT          NOT NULL,    -- many-to-one
    CONSTRAINT FK_ShiftReport_ProcessUnit FOREIGN KEY (UnitID) REFERENCES ProcessUnit(UnitID)
);

CREATE TABLE ProductFlow (
    ProductID         INT            NOT NULL PRIMARY KEY,
    ProductName       NVARCHAR(50)   NOT NULL,
    Quantity          INT            NOT NULL,
    [Date]            DATE           NOT NULL,
    Destination       NVARCHAR(50)   NOT NULL,
    InputTonnage      FLOAT          NOT NULL,
    OutputTonnage     FLOAT          NOT NULL,
    RecoveredTonnage  FLOAT          NOT NULL,
    RejectedTonnage   FLOAT          NOT NULL,
    MaterialFlowID    INT            NOT NULL,
    CONSTRAINT FK_ProductFlow_MaterialFlow FOREIGN KEY (MaterialFlowID) REFERENCES MaterialFlow(MaterialFlowID)
);

CREATE TABLE EnergyUsage (
    UsageID      INT           NOT NULL PRIMARY KEY,
    UsageDate    DATE          NOT NULL,
    EnergyType   NVARCHAR(50)  NOT NULL,              -- Electricity, Gas, Water
    Consumption  INT           NOT NULL,
    Cost         INT           NOT NULL,
    UnitID       INT           NOT NULL,          -- many-to-one
    CONSTRAINT FK_EnergyUsage_ProcessUnit FOREIGN KEY (UnitID) REFERENCES ProcessUnit(UnitID)
);

CREATE TABLE ChemicalAnalysis (
    TestID          INT           NOT NULL PRIMARY KEY,
    TestDate        DATE          NOT NULL,
    TestTime        TIME(0)       NOT NULL,
    TestType        NVARCHAR(50)  NOT NULL,           -- Conductivity, TDS, pH
    TestResult      BIT           NOT NULL,           -- 0 = successful, 1 = unsuccessful
    CopperPercent   FLOAT         NOT NULL,
    MaterialFlowID  INT           NOT NULL,   -- one-to-one
    CONSTRAINT FK_ChemicalAnalysis_MaterialFlow FOREIGN KEY (MaterialFlowID) REFERENCES MaterialFlow(MaterialFlowID),
    CONSTRAINT UQ_ChemicalAnalysis_MaterialFlowID UNIQUE (MaterialFlowID)
);

CREATE TABLE RecoveryIndicators (
    IndicatorID      INT           NOT NULL PRIMARY KEY,
    RecoveryDate     DATE          NOT NULL,
    RecoveryPercent  INT           NOT NULL,
    ProcessType      NVARCHAR(50)  NOT NULL,          -- Physical, Chemical, Hybrid
    RecoveryCost     INT           NOT NULL,          -- million tomans
    MaterialFlowID   INT           NOT NULL,  -- one-to-one
    CONSTRAINT FK_RecoveryIndicators_MaterialFlow FOREIGN KEY (MaterialFlowID) REFERENCES MaterialFlow(MaterialFlowID),
    CONSTRAINT UQ_RecoveryIndicators_MaterialFlowID UNIQUE (MaterialFlowID)
);

CREATE TABLE WarehouseStock (
    StockID       INT           NOT NULL PRIMARY KEY,
    StockDate     DATE          NOT NULL,
    MaterialType  NVARCHAR(50)  NOT NULL,
    Quantity      INT           NOT NULL,
    Location      NVARCHAR(50)  NOT NULL,             -- Final, Return or Fines warehouse
    UnitID        INT           NOT NULL,         -- many-to-one
    CONSTRAINT FK_WarehouseStock_ProcessUnit FOREIGN KEY (UnitID) REFERENCES ProcessUnit(UnitID)
);

CREATE TABLE ShiftStaff (
    EmployeeID          INT           NOT NULL PRIMARY KEY,
    Name                NVARCHAR(100) NOT NULL,
    Role                NVARCHAR(50)  NOT NULL,       -- Operator, Engineer, Manager
    PerformancePercent  INT           NOT NULL,
    OvertimeHours       INT           NOT NULL,
    ReportID            INT           NOT NULL, -- many-to-one
    CONSTRAINT FK_ShiftStaff_ShiftReport FOREIGN KEY (ReportID) REFERENCES ShiftReport(ReportID)
);

CREATE TABLE Shipment (
    ShipmentID      INT           NOT NULL PRIMARY KEY,
    ShipDate        DATE          NOT NULL,
    ShipTime        TIME(0)       NOT NULL,
    CopperPercent   FLOAT         NOT NULL,
    BarrelCount     INT           NOT NULL,
    DryWeight       FLOAT         NOT NULL,
    Destination     NVARCHAR(50)  NOT NULL,
    ShippingCost    INT           NOT NULL,           -- million tomans
    ShipmentStatus  BIT           NOT NULL,           -- 1 = shipped, 0 = awaiting shipment
    ProductID       INT           NOT NULL,         -- one-to-one
    CONSTRAINT FK_Shipment_ProductFlow FOREIGN KEY (ProductID) REFERENCES ProductFlow(ProductID),
    CONSTRAINT UQ_Shipment_ProductID UNIQUE (ProductID)
);
