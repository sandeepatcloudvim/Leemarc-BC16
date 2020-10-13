pageextension 50006 "LEE_Ext_CustList" extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
        addafter("No.")
        {
            field("Customer Category"; "Customer Category")
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