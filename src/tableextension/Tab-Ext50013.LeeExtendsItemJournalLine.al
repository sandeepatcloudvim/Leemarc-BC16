tableextension 50013 "Lee_ExtendsItemJournalLine" extends "Item Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "Color Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Color"."Color Code" WHERE("Item No." = FIELD("Item No."));

        }
        field(50001; "Size Code"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Item Size"."Size Code" WHERE("Item No." = FIELD("Item No."));
        }

    }
}