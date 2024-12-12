@EndUserText.label: 'Error Code KVB'
@AccessControl.authorizationCheck: #NOT_ALLOWED
@Metadata.allowExtensions: true
define view entity ZI_ErrorCodeKvb
  as select from zerrcode_kvb
  association to parent ZI_ErrorCodeKvb_S as _ErrorCodeKvbAll on $projection.SingletonID = _ErrorCodeKvbAll.SingletonID
{
  key error_code as ErrorCode,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  @Consumption.hidden: true
  local_last_changed_at as LocalLastChangedAt,
  @Consumption.hidden: true
  1 as SingletonID,
  _ErrorCodeKvbAll
  
}
