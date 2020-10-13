tableextension 50003 "LEE_Extends_SalesLine" extends "Sales Line"
{
    fields
    {
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

            trigger OnValidate();
            begin
                IF ("LEE_Color Code" <> '') THEN
                    TESTFIELD(Type, 2);
                GetItemVariant();
            end;
        }
        field(50003; "PKG_CUSTOM3"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50012; "Production Status"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Production Status".Code;

            trigger OnValidate()
            var
                ProdStatus: Record "Production Status";
                SalesLineStatusTest: Record "Sales Line";
                // EventMgmt: Codeunit "Event Management";
                // NotifyEvent: Record "Notification Event";
                SalesHeader: Record "Sales Header";
            begin

                IF (ProdStatus.GET("Production Status")) THEN BEGIN
                    IF (FORMAT(ProdStatus."Due Date Formula") <> '') THEN
                        "Status Due Date" := CALCDATE(ProdStatus."Due Date Formula", TODAY);
                END ELSE
                    "Status Due Date" := 0D;

                // OPS21: Begin
                // IF ("Production Status" <> xRec."Production Status") THEN BEGIN
                //     IF (ProdStatus.GET("Production Status")) THEN BEGIN
                //         // IF (NotifyEvent.GET(ProdStatus."Notification Event Code")) THEN BEGIN
                //         //     SalesLineStatusTest.SETRANGE("Document Type", "Document Type");
                //         //     SalesLineStatusTest.SETRANGE("Document No.", "Document No.");
                //         //     SalesLineStatusTest.SETRANGE(Type, Type::Item);
                //         //     SalesLineStatusTest.SETFILTER("Production Status", '<>%1', "Production Status");
                //         //     SalesLineStatusTest.SETFILTER("Line No.", '<>%1', "Line No.");
                //         //     IF NOT (SalesLineStatusTest.FINDFIRST) THEN BEGIN
                //         //         IF (SalesHeader.GET("Document Type", "Document No.")) THEN
                //         //             EventMgmt.AddSalesDocEvent(SalesHeader, NotifyEvent.Code, '');
                //         //     END;
                //         END;
                //     END;
                // END;
                // OPS21: End
            end;
        }
        field(50013; "Status Due Date"; Date)
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
        field(50002; "Size Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = IF (Type = CONST(Item)) "Item Size"."Size Code" WHERE("Item No." = FIELD("No."));
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

    local procedure GetItemVariant()
    var
        rItemVariant: Record "Item Variant";
    begin

        rItemVariant.SETRANGE("Item No.", "No.");
        rItemVariant.SETRANGE("Color Code", "LEE_Color Code");
        rItemVariant.SETRANGE("Size Code", "Size Code");
        IF NOT (rItemVariant.FINDFIRST) THEN
            CLEAR(rItemVariant);

        VALIDATE("Variant Code", rItemVariant.Code);
    end;
}