pageextension 50005 "LEE_Ext_CustCard" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(Blocked)
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