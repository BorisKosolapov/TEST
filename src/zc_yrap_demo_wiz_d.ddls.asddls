@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_YRAP_DEMO_WIZ_D
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_YRAP_DEMO_WIZ_D
{
  key Id,
  Firstname,
  Lastname,
  Age,
  Gender,
  Role,
  Salary,
  Active,
  Localcreatedby,
  Localcreatedat,
  Locallastchangedby,
  Locallastchangedat,
  Lastchangedat,
  Draftentitycreationdatetime,
  Draftentitylastchangedatetime,
  Draftadministrativedatauuid,
  Draftentityoperationcode,
  Hasactiveentity,
  Draftfieldchanges
  
}
