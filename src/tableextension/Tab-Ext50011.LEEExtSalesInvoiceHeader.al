tableextension 50011 "LEE_Ext_SalesInvoiceHeader" extends "Sales Invoice Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "LEE_Start Ship Date"; Date)
        {
            Caption = 'Start Ship Date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
            end;
        }
        field(50021; "Custom Order"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}