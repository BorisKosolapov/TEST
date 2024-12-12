@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_600EMPLOYEE
  as select from Z600EMPLOYEE
{
  key employee as Employee,
  first_name as FirstName,
  last_name as LastName,
  birth_date as BirthDate,
  entry_date as EntryDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  annual_salary as AnnualSalary,
  currency_code as CurrencyCode,
  department_id as DepartmentId,
  manager as Manager,
  createdby as Createdby,
  createdat as Createdat,
  lastchangedby as Lastchangedby,
  lastchangedat as Lastchangedat
  
}
