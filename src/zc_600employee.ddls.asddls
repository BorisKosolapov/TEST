@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_600EMPLOYEE
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_600EMPLOYEE
{
  key Employee,
  FirstName,
  LastName,
  BirthDate,
  EntryDate,
  AnnualSalary,
  @Semantics.currencyCode: true
  CurrencyCode,
  DepartmentId,
  Manager,
  Createdby,
  Createdat,
  Lastchangedby,
  Lastchangedat
  
}
