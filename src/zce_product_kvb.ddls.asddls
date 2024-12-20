@EndUserText.label: 'Read product data via'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_PRODUCT_VIA_RFC_KVB'
@UI: {
  headerInfo: {
  typeName: 'Product',
  typeNamePlural: 'Products'
  }
}

define root custom entity zce_product_kvb
{

      @UI.facet     : [
        {
          id        :       'Product',
          purpose   :  #STANDARD,
          type      :     #IDENTIFICATION_REFERENCE,
          label     :    'Product',
          position  : 10 }
      ]
      // DDL source code for custom entity for BAPI_EPM_PRODUCT_HEADER

      @UI           : {
      lineItem      : [{position: 10, importance: #HIGH}],
      identification: [{position: 10}],
      selectionField: [{position: 10}]
      }
  key product_id     : abap.char( 10 );
  
      TypeCode      : abap.char( 2 );
      
      
      
      @UI           : {
      lineItem      : [{position: 20, importance: #HIGH}],
      identification: [{position: 20}],
      selectionField: [{position: 20}]
      }
      Category      : abap.char( 40 );
      
      
      @UI           : {
      lineItem      : [{position: 30, importance: #HIGH}],
      identification: [{position: 30}],
      selectionField: [{position: 30}]
      }
      Name          : abap.char( 255 );
      
//    <--Begin      
      @UI           : {
      lineItem      : [{position: 40, importance: #HIGH}],      
      identification: [{position: 40}],
      selectionField: [{position: 40}]      
      }
      Description   : abap.char( 255 );
//    --> End      
      
      
      
      SupplierId    : abap.char( 10 );
      SupplierName  : abap.char( 80 );
      TaxTarifCode  : abap.int1;
      @Semantics.unitOfMeasure: true
      MeasureUnit   : abap.unit( 3 );
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      WeightMeasure : abap.quan( 13, 3 );
      @Semantics.unitOfMeasure: true
      WeightUnit    : abap.unit( 3 );
      @UI           : {
      lineItem      : [{position: 50, importance: #HIGH}],
      identification: [{position: 50}]
      }
      Price         : abap.dec( 23, 4 );
      @Semantics.currencyCode: true
      currency_code  : abap.cuky( 5 );
      @Semantics.quantity.unitOfMeasure: 'DimUnit'
      Width         : abap.quan( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'DimUnit'
      Depth         : abap.quan( 13, 3 );
      @Semantics.quantity.unitOfMeasure: 'DimUnit'
      Height        : abap.quan( 13, 3 );
      @Semantics.unitOfMeasure: true
      DimUnit       : abap.unit( 3 );
      ProductPicUrl : abap.char( 255 );

}
