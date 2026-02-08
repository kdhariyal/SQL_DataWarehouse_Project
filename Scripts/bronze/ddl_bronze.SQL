/*
==========================================================
DDL Script: Create Bronze Tables
==========================================================

Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables
    if they already exist.
    Run this script to re-define the DDL structure of 'bronze' Tables
==========================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME,
            @end_time DATETIME,
            @start_time_batch DATETIME,
            @end_time_batch DATETIME;

    BEGIN TRY
    SET @start_time_batch = GETDATE();
        PRINT '==========================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '==========================================================';

        -- Drop and Create Tables
        IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
            DROP TABLE bronze.crm_cust_info;
        CREATE TABLE bronze.crm_cust_info (
            cst_id INT,
            cst_key NVARCHAR(50),
            cst_firstname NVARCHAR(50),
            cst_lastname NVARCHAR(50),
            cst_martial_status NVARCHAR(50),
            cst_gndr NVARCHAR(50),
            cst_create_date DATETIME
        );

        IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
            DROP TABLE bronze.crm_prd_info;
        CREATE TABLE bronze.crm_prd_info (
            prd_id INT,
            prd_key NVARCHAR(50),
            prd_nm NVARCHAR(50),
            prd_cost INT,
            prd_line NVARCHAR(50),
            prd_start_dt DATETIME,
            prd_end_dt DATETIME
        );

        IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
            DROP TABLE bronze.crm_sales_details;
        CREATE TABLE bronze.crm_sales_details (
            sls_ord_num NVARCHAR(50),
            sls_ord_key NVARCHAR(50),
            sls_cust_id INT,
            sls_ord_dt INT,
            sls_ship_dt INT,
            sls_due_dt INT,
            sls_sales INT,
            sls_quantity INT,
            sls_price INT
        );

        IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
            DROP TABLE bronze.erp_loc_a101;
        CREATE TABLE bronze.erp_loc_a101 (
            cid NVARCHAR(50),
            cntry NVARCHAR(50)   
        );

        IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
            DROP TABLE bronze.erp_cust_az12;
        CREATE TABLE bronze.erp_cust_az12 (
            cid NVARCHAR(50),
            bdate DATE,
            gen NVARCHAR(50)
        );

        IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
            DROP TABLE bronze.erp_px_cat_g1v2;
        CREATE TABLE bronze.erp_px_cat_g1v2 (
            id NVARCHAR(50),
            cat NVARCHAR(50),
            subcat NVARCHAR(50),
            maintenance NVARCHAR(50)
        );

        -- Load crm_cust_info
        PRINT 'Truncating table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT 'Inserting into table: bronze.crm_cust_info';
        SET @start_time = GETDATE();
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'Time taken to load crm_cust_info: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        SELECT COUNT(*) AS TotalRows FROM bronze.crm_cust_info;

        -- Load crm_prd_info
        PRINT 'Truncating table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT 'Inserting into table: bronze.crm_prd_info';
        SET @start_time = GETDATE();
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'Time taken to load crm_prd_info: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        SELECT COUNT(*) AS TotalRows FROM bronze.crm_prd_info;

        -- Load crm_sales_details
        PRINT 'Truncating table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT 'Inserting into table: bronze.crm_sales_details';
        SET @start_time = GETDATE();
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'Time taken to load crm_sales_details: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        SELECT COUNT(*) AS TotalRows FROM bronze.crm_sales_details;

        -- Load erp_loc_a101
        PRINT 'Truncating table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT 'Inserting into table: bronze.erp_loc_a101';
        SET @start_time = GETDATE();
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'Time taken to load erp_loc_a101: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        SELECT COUNT(*) AS TotalRows FROM bronze.erp_loc_a101;

        -- Load erp_cust_az12
        PRINT 'Truncating table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT 'Inserting into table: bronze.erp_cust_az12';
        SET @start_time = GETDATE();
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'Time taken to load erp_cust_az12: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        SELECT COUNT(*) AS TotalRows FROM bronze.erp_cust_az12;

        -- Load erp_px_cat_g1v2
        PRINT 'Truncating table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT 'Inserting into table: bronze.erp_px_cat_g1v2';
        SET @start_time = GETDATE();
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\HP\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT 'Time taken to load erp_px_cat_g1v2: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';

        SELECT COUNT(*) AS TotalRows FROM bronze.erp_px_cat_g1v2;

        PRINT '==========================================================';
        PRINT 'Bronze Layer Loaded Successfully';
        PRINT '==========================================================';
    SET @end_time_batch = GETDATE();
        PRINT 'Total Time taken for Bronze Layer: ' + CAST(DATEDIFF(SECOND, @start_time_batch, @end_time_batch) AS NVARCHAR) + ' seconds';
        PRINT '==========================================================';
    END TRY
    BEGIN CATCH
        PRINT '==========================================================';
        PRINT 'Error occurred while loading Bronze Layer';
        PRINT '==========================================================';
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS NVARCHAR);
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
    END CATCH
END

-- Run the procedure
EXEC bronze.load_bronze;
