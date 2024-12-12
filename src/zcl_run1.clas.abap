CLASS zcl_run1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces: if_oo_adt_classrun.
  methods: do_smth RETURNING VALUE(rv_response) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RUN1 IMPLEMENTATION.


method do_smth.
TRY.
"create http destination by url; API endpoint for API sandbox
DATA(lo_http_destination) =
     cl_http_destination_provider=>create_by_url(
 'https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap/API_BILLING_DOCUMENT_SRV/A_BillingDocument(''90000000'')'
     ).
  "alternatively create HTTP destination via destination service
    "cl_http_destination_provider=>create_by_cloud_destination( i_name = '<...>'
     "                            i_service_instance_name = '<...>' )
    "SAP Help: https://help.sap.com/viewer/65de2977205c403bbc107264b8eccf4b/Cloud/en-US/f871712b816943b0ab5e04b60799e518.html

"create HTTP client by destination
DATA(lo_web_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_http_destination ) .

"adding headers with API Key for API Sandbox
DATA(lo_web_http_request) = lo_web_http_client->get_http_request( ).
lo_web_http_request->set_header_fields( VALUE #(
(  name = 'APIKey' value = 'ZiIaMKo3dHxTUGzp8Gcyxx0GOI9tbHbd' )
(  name = 'DataServiceVersion' value = '2.0' )
(  name = 'Accept' value = 'application/json' )
 ) ).

"set request method and execute request
DATA(lo_web_http_response) = lo_web_http_client->execute( if_web_http_client=>GET ).
DATA(lv_response) = lo_web_http_response->get_text( ).
rv_response = lv_response.

CATCH cx_http_dest_provider_error cx_web_http_client_error cx_web_message_error.
    "error handling
ENDTRY.

"uncomment the following line for console output; prerequisite: code snippet is implementation of if_oo_adt_classrun~main
"out->write( |response:  { lv_response }| ).
lo_web_http_response->set_text( 'Hallo' ).
endmethod.


method: if_oo_adt_classrun~main.
*do_smth(  ).
out->write( do_smth(  ) ).
endmethod.
ENDCLASS.
