tableextension 50001 "LEE_ExtSalesInvLine" extends "Sales Invoice Line"
{
    fields
    {
        // Add changes to table fields here
        field(50035; LEE_Embellishment; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = LEE_Embellishment;
            Caption = 'Embellishment';
        }
        field(50001; "LEE_Color Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = IF (Type = CONST(Item)) "Item Color"."Color Code" WHERE("Item No." = FIELD("No."));
        }
        field(50002; "Size Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = IF (Type = CONST(Item)) "Item Size"."Size Code" WHERE("Item No." = FIELD("No."));
        }
        field(50003; "PKG_CUSTOM3"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50020; "Custom Item Group"; Code[30])
        {
            TableRelation = "Custom Item Group".Code;
        }

        field(50021; "Pattern Code"; Code[10])
        {
            TableRelation = "Custom Pattern"."Pattern Code" WHERE("Custom Item Group No." = FIELD("Custom Item Group"));
        }
        field(50022; "Custom Item No."; Code[20])
        {
            TableRelation = "Pattern Item"."Item No." WHERE("Pattern Code" = FIELD("Pattern Code"));
        }
        field(50024; Fit; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Custom Option".Code WHERE(Type = CONST(Fit));
        }
        field(50025; Zip; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Custom Option".Code WHERE(Type = CONST(Zip));
        }
        field(50026; Pad; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Custom Option".Code WHERE(Type = CONST(Pad));
        }
        field(50027; "Lycra Color"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Custom Option".Code WHERE(Type = CONST("Lycra Color"));
        }
        field(50028; "Flat Lock"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Custom Option".Code WHERE(Type = CONST("Flat Lock"));
        }
        field(50029; Fabric; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Custom Option".Code WHERE(Type = CONST(Fabric));
        }
    }

    var
        myInt: Integer;
}