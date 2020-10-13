pageextension 50007 "LEE_Ext_ItemCard" extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
        addafter("Search Description")
        {
            field("LEE_Export Brand Group"; "LEE_Export Brand Group")
            {
                Caption = 'Export Brand Group';
                ApplicationArea = All;
            }
        }
        addafter(WorkflowStatus)
        {
            group(Style)
            {
                field(Color; LEE_Color)
                {
                    Caption = 'Color';
                    ApplicationArea = All;
                }
                field(Pattern; LEE_Pattern)
                {
                    Caption = 'Pattern';
                    ApplicationArea = All;
                }
                field(Zip; LEE_Zip)
                {
                    Caption = 'Zip';
                    ApplicationArea = All;
                }
                field(Fit; LEE_Fit)
                {
                    Caption = 'Fit';
                    ApplicationArea = All;
                }
                field(Pad; LEE_Pad)
                {
                    Caption = 'Pad';
                    ApplicationArea = All;
                }
                field("Flat Lock"; "LEE_Flat Lock")
                {
                    Caption = 'Flat Lock';
                    ApplicationArea = All;
                }
                field(Fabric; LEE_Fabric)
                {
                    Caption = 'Flat Lock';
                    ApplicationArea = All;
                }
                field("Custom Item Group"; "LEE_Custom Item Group")
                {
                    Caption = 'Custom Item Group';
                    ApplicationArea = All;
                }
                field("Custom Item No."; "LEE_Custom Item No.")
                {
                    Caption = 'Custom Item No.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter(Period)
        {
            action(Colour)
            {
                ApplicationArea = All;
                Caption = 'Color';
                Image = ItemVariant;
                RunObject = page "Item Availability by Colors";
                RunPageLink = "Item No." = FIELD("No.");
                RunPageView = SORTING("Item No.", "Color Sort Order") ORDER(Ascending);

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}