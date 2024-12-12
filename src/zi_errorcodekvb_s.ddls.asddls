@EndUserText.label: 'Error Code KVB Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.semanticKey: [ 'SingletonID' ]
@UI: {
  headerInfo: {
    typeName: 'ErrorCodeKvbAll'
  }
}
define root view entity ZI_ErrorCodeKvb_S
  as select from I_Language
    left outer join ZERRCODE_KVB on 0 = 0
  composition [0..*] of ZI_ErrorCodeKvb as _ErrorCodeKvb
{
  @UI.facet: [ {
    id: 'ZI_ErrorCodeKvb', 
    purpose: #STANDARD, 
    type: #LINEITEM_REFERENCE, 
    label: 'Error Code KVB', 
    position: 1 , 
    targetElement: '_ErrorCodeKvb'
  } ]
  @UI.lineItem: [ {
    position: 1 
  } ]
  key 1 as SingletonID,
  _ErrorCodeKvb,
  @UI.hidden: true
  max( ZERRCODE_KVB.LAST_CHANGED_AT ) as LastChangedAtMax
  
}
where I_Language.Language = $session.system_language
