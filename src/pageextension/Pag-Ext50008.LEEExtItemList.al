pageextension 50008 "LEE_Ext_ItemList" extends "Item List"
{
    layout
    {
        // Add changes to page layout here
        addafter(Description)
        {
            field("Export Brand Group"; "LEE_Export Brand Group")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}