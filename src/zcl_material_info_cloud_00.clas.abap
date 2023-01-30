CLASS zcl_material_info_cloud_00 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        product               TYPE i_product-product
      RETURNING
        VALUE(material_art) TYPE i_product-ProductType.
ENDCLASS.



CLASS zcl_material_info_cloud_00 IMPLEMENTATION.


  METHOD get_material_art.
    DATA material TYPE I_PRODUCT .
    DATA production_date TYPE datn.

* Quick Fix Replace deprecated object DTEL BOOLE_D with released object DTEL ABAP_BOOLEAN
* 01/30/2023 04:16:44 STUDENT00
* Transport S4HK902224 Custom Code Migration Partner Bootcamp APJ
* Replaced Code:
*    DATA bool_tmp TYPE boole_d.

DATA bool_tmp TYPE ABAP_BOOLEAN .

* End of Quick Fix



* Quick Fix Replace 'SY-DATUM' with cl_abap_context_info=>get_system_date( ).
* 01/30/2023 04:16:44 STUDENT00
* Transport S4HK902224 Custom Code Migration Partner Bootcamp APJ
* Replaced Code:
*    production_date = sy-datum.

PRODUCTION_DATE = cl_abap_context_info=>get_system_date( ).

* End of Quick Fix



* Quick Fix Replace 'OLD SQL' with NEW SQL.
* 01/30/2023 04:16:44 STUDENT00
* Transport S4HK902224 Custom Code Migration Partner Bootcamp APJ
* Replaced Code:
*    SELECT SINGLE mtart FROM mara INTO CORRESPONDING FIELDS OF material WHERE matnr = matnr.

SELECT SINGLE FROM I_PRODUCT fields producttype WHERE product = @product INTO CORRESPONDING FIELDS OF @MATERIAL .

* End of Quick Fix



* Quick Fix Replace MOVE with an assignment.
* 01/30/2023 04:16:44 STUDENT00
* Transport S4HK902224 Custom Code Migration Partner Bootcamp APJ
* Replaced Code:
*    MOVE material-mtart TO material_art.

MATERIAL_ART = MATERIAL-ProductType.

* End of Quick Fix


  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_info_cloud_00.
    material_info = NEW zcl_material_info_cloud_00(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.

