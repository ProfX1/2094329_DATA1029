CREATE USER "pharmacist2"@"localhost" identified by "pharma";
grant alter, select, update on epharmacy.* to "pharmacist2"@"localhost";
