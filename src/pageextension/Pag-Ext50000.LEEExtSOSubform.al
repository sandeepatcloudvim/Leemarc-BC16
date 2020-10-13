pageextension 50000 "LEE_Ext_SOSubform" extends "Sales Order Subform"
{
    layout
    {
        addfirst(Control1)
        {
            field("Custom Item Group"; "Custom Item Group")
            {
                ApplicationArea = All;
            }
            field("Pattern Code"; "Pattern Code")
            {
                ApplicationArea = ALl;
            }
            field("Custom Item No."; "Custom Item No.")
            {
                ApplicationArea = All;
            }
            field(Fit; Fit)
            {
                ApplicationArea = All;
            }
            field(Zip; Zip)
            {
                ApplicationArea = All;
            }
            field(Pad; Pad)
            {
                ApplicationArea = All;
            }
            field("Lycra Color"; "Lycra Color")
            {
                ApplicationArea = All;
            }
            field("Flat Lock"; "Flat Lock")
            {
                ApplicationArea = All;
            }
            field(Fabric; Fabric)
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field(LEE_Embellishment; LEE_Embellishment)
            {
                Caption = 'Embellishment';
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