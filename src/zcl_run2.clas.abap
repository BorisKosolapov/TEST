CLASS zcl_run2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces: if_oo_adt_classrun.
  methods: do_smth RETURNING VALUE(rv_response) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RUN2 IMPLEMENTATION.


method do_smth.

DATA:
  ls_entity_key    TYPE z_cons_model2=>tys_a_billing_document_type,
  ls_business_data TYPE z_cons_model2=>tys_a_billing_document_type,
  lo_http_client   TYPE REF TO if_web_http_client,
  lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
  lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
  lo_request       TYPE REF TO /iwbep/if_cp_request_read,
  lo_response      TYPE REF TO /iwbep/if_cp_response_read.



     TRY.
     " Create http client
***DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
***                                             comm_scenario  = '<Comm Scenario>'
***                                             comm_system_id = '<Comm System Id>'
***                                             service_id     = '<Service Id>' ).

DATA(lo_destination) = cl_http_destination_provider=>create_by_url( i_url =  'https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap/API_BILLING_DOCUMENT_SRV/A_BillingDocument(''90000000'')' ).

" 'https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap/API_BILLING_DOCUMENT_SRV/A_BillingDocument(''90000000'')'

     lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
     lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
       EXPORTING
          is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                              proxy_model_id      = 'Z_CONS_MODEL2'
                                              proxy_model_version = '0001' )
         io_http_client             = lo_http_client
         iv_relative_service_root   = '/sap/opu/odata/sap/API_BILLING_DOCUMENT_SRV' ).

*     lo_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
*       EXPORTING
*        iv_service_definition_name = 'Z_CONS_MODEL2'
*         io_http_client             = lo_http_client
*         iv_relative_service_root   = '/sap/opu/odata/sap/API_BILLING_DOCUMENT_SRV' ).


     ASSERT lo_http_client IS BOUND.


" Set entity key
ls_entity_key = VALUE #(
          billing_document  = '90000000' ).

" Navigate to the resource
lo_resource = lo_client_proxy->create_resource_for_entity_set( 'A_BILLING_DOCUMENT' )->navigate_with_key( ls_entity_key ).

" Execute the request and retrieve the business data
lo_response = lo_resource->create_request_for_read( )->execute( ).
lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).

  CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
" Handle remote Exception
" It contains details about the problems of your http(s) connection

CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
" Handle Exception

CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
" Handle Exception
 RAISE SHORTDUMP lx_web_http_client_error.


ENDTRY.


endmethod.


method: if_oo_adt_classrun~main.
do_smth(  ).
*out->write( do_smth(  ) ).
endmethod.
ENDCLASS.
