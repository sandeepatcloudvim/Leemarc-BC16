tableextension 50007 "LEE_Ext_SH" extends "Sales Header"
{
    fields
    {
        field(50000; "LEE_Start Ship Date"; Date)
        {
            Caption = 'Start Ship Date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                // OPS01: Begin
                IF ("LEE_Start Ship Date" > "Shipment Date") THEN
                    VALIDATE("Shipment Date", "LEE_Start Ship Date");
                UpdateSalesLines(FIELDCAPTION("LEE_Start Ship Date"), CurrFieldNo <> 0);
                // OPS01: End
            end;
        }
        field(50001; "LEE_Cancel Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Cancel Date';
            trigger OnValidate()
            begin

            end;
        }
        field(50002; "Designer Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(50021; "Custom Order"; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}