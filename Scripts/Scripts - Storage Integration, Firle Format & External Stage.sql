
--------- Storage Integration Script -----------

CREATE or replace STORAGE INTEGRATION aws_s3_integration
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = 'S3'
ENABLED = TRUE
STORAGE_AWS_ROLE_ARN = '====== IAM Role ARN ======='
STORAGE_ALLOWED_LOCATIONS = ('s3://snowflake-external-table-demo-0522/') ;

--------- File Format Script -----------


CREATE OR REPLACE file format AWS_S3_CSV_Format
    type = csv
    field_delimiter = ','
    skip_header = 1
    null_if = ('NULL','null')
    empty_field_as_null = TRUE
    FIELD_OPTIONALLY_ENCLOSED_BY='"'
;


--------- External Stage Script -----------


CREATE or replace STAGE AWS_S3_Stage
STORAGE_INTEGRATION = aws_s3_integration 
URL = 's3://snowflake-external-table-demo-0522/'
FILE_FORMAT = AWS_S3_CSV_Format
;
